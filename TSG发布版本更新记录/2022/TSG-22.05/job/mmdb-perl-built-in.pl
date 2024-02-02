use strict;      #use this all times
use warnings;    #this too - helps a lot!
use JSON;
use MaxMind::DB::Writer::Tree;
use Getopt::Long;
use DBI;
use utf8;
use LWP::UserAgent;
binmode(STDIN,":encoding(gbk)");

###################数据库连接信息###################
my $url="http://{{ cm_mariadb_host }}:8080/v1/geolocation/dict/detail";
my $token="ed04b942-7df4-4e3d-b9a9-a881ca98a867";

my $help = 0;
my $outfileV6 = 'ip_v6_built_in.mmdb';
my $outfileV4 = 'ip_v4_built_in.mmdb';

GetOptions("db=s" => \$outfileV6, 'help|?' => \$help, )
or &help();

GetOptions("db=s" => \$outfileV4, 'help|?' => \$help, )
or &help();

&help() if $help;
my %types = (
        AREA_CODE => 'utf8_string',
        ASN => 'utf8_string',
        ISP => 'utf8_string',
        LATITUDE => 'utf8_string',
        LONGITUDE => 'utf8_string',
        COUNTRY => 'utf8_string',
        SUPER_ADMINISTRATIVE_AREA => 'utf8_string',
        ADMINISTRATIVE_AREA => 'utf8_string',
        SUB_ADMINISTRATIVE_AREA => 'utf8_string',
        LOCALITY => 'utf8_string',
        DEPENDENT_LOCALITY => 'utf8_string',
        DOUBLE_DEPENDENT_LOCALITY => 'utf8_string',
);

# V6databse info
my $treeV6 = MaxMind::DB::Writer::Tree->new(
       ip_version            => 6,
       record_size           => 24,
       database_type         => 'IPLOCATOR',
       languages             => ['en'],
       description           => { en => 'My database of IP data' },
       map_key_type_callback => sub { $types{ $_[0] } },
       remove_reserved_networks => 0,
);
# V4databse info
my $treeV4 = MaxMind::DB::Writer::Tree->new(
       ip_version            => 4,
       record_size           => 24,
       database_type         => 'IPLOCATOR',
       languages             => ['en'],
       description           => { en => 'My database of IP data' },
       map_key_type_callback => sub { $types{ $_[0] } },
       remove_reserved_networks => 0,
);
$treeV4->insert_range(
      "0.0.0.0",
      "0.0.0.0",
  {
      AREA_CODE => ' ',
      ASN       => ' ',
      ISP       => ' ',
      LATITUDE  => '00',
      LONGITUDE => '00',
      COUNTRY   => changeSplit('aa'),
      SUPER_ADMINISTRATIVE_AREA => changeSplit('aa'),
      ADMINISTRATIVE_AREA => changeSplit('aa'),
      SUB_ADMINISTRATIVE_AREA => changeSplit('aa'),
      LOCALITY => changeSplit('aa'),
      DEPENDENT_LOCALITY => changeSplit('aa'),
      DOUBLE_DEPENDENT_LOCALITY => changeSplit('aa'),
  },
);


$treeV6->insert_range(
      "0000:0000:0000:0000:0000:0000:0000:0000",
      "0000:0000:0000:0000:0000:0000:0000:0000",
  {
      AREA_CODE => ' ',
      ASN       => ' ',
      ISP       => ' ',
      LATITUDE  => '00',
      LONGITUDE => '00',
      COUNTRY   => changeSplit('aa'),
      SUPER_ADMINISTRATIVE_AREA => changeSplit('aa'),
      ADMINISTRATIVE_AREA => changeSplit('aa'),
      SUB_ADMINISTRATIVE_AREA => changeSplit('aa'),
      LOCALITY => changeSplit('aa'),
      DEPENDENT_LOCALITY => changeSplit('aa'),
      DOUBLE_DEPENDENT_LOCALITY => changeSplit('aa'),
  },
);
my $sum = 0;
my $ua = new LWP::UserAgent;
#提取API接口中的信息，放到一个数组中
my @dataList;
while(1==1){
my $request = new HTTP::Request("GET", "$url?isInitialize=1&pageSize=10000&pageNo=$sum");
$request->header('Authorization' => 'ed04b942-7df4-4e3d-b9a9-a881ca98a867');
my $response = $ua->request($request);
my $json = new JSON;
my $obj = $json->decode($response->content);
my $list=$obj->{"data"}->{"list"};
my $JSON =JSON->new->allow_nonref;
my $data = $JSON->encode($list);
my $arraydata=decode_json($data);
$sum+=1;
foreach my $ref (@$arraydata) {
  if(($ref->{'addrType'}) == 4){
          $treeV4->insert_range(
               $ref->{'startIp'},
               $ref->{'endIp'},
          {
              AREA_CODE => isNotBlank($ref->{'areacode'}),
              ASN       => isNotBlank($ref->{'asnumber'}),
              ISP       => isNotBlank($ref->{'isp'}),
              LATITUDE  => isNotBlank($ref->{'latitude'}),
              LONGITUDE => isNotBlank($ref->{'longitude'}),
              COUNTRY   => changeSplit(isNotBlank($ref->{'country'})),
              SUPER_ADMINISTRATIVE_AREA => changeSplit(isNotBlank($ref->{'superAdministrativeArea'})),
              ADMINISTRATIVE_AREA => changeSplit(isNotBlank($ref->{'administrativeArea'})),
              SUB_ADMINISTRATIVE_AREA => changeSplit(isNotBlank($ref->{'subAdministrativeArea'})),
              LOCALITY => changeSplit(isNotBlank($ref->{'locality'})),
              DEPENDENT_LOCALITY => changeSplit(isNotBlank($ref->{'dependentLocality'})),
              DOUBLE_DEPENDENT_LOCALITY => changeSplit(isNotBlank($ref->{'doubleDependentLocality'})),
           },
        );
  }elsif (($ref->{'addrType'}) == 6) {
        $treeV6->insert_range(
            $ref->{'startIp'},
            $ref->{'endIp'},
            {
            AREA_CODE => isNotBlank($ref->{'areacode'}),
            ASN       => isNotBlank($ref->{'asnumber'}),
            ISP       => isNotBlank($ref->{'isp'}),
            LATITUDE  => isNotBlank($ref->{'latitude'}),
            LONGITUDE => isNotBlank($ref->{'longitude'}),
            COUNTRY   => changeSplit(isNotBlank($ref->{'country'})),
            SUPER_ADMINISTRATIVE_AREA => changeSplit(isNotBlank($ref->{'superAdministrativeArea'})),
            ADMINISTRATIVE_AREA => changeSplit(isNotBlank($ref->{'administrativeArea'})),
            SUB_ADMINISTRATIVE_AREA => changeSplit(isNotBlank($ref->{'subAdministrativeArea'})),
            LOCALITY => changeSplit(isNotBlank($ref->{'locality'})),
            DEPENDENT_LOCALITY => changeSplit(isNotBlank($ref->{'dependentLocality'})),
            DOUBLE_DEPENDENT_LOCALITY => changeSplit(isNotBlank($ref->{'doubleDependentLocality'})),
            },
        );
    }
  }
if(@$arraydata<10000){
	last;
   }
}
open my $fhV6, '>:raw', $outfileV6;
$treeV6->write_tree($fhV6);

open my $fhV4, '>:raw', $outfileV4;
$treeV4->write_tree($fhV4);

sub change {
  my $n = scalar(@_);
  my $i = $_[0];

  my $w = ($i / 16777216) % 256;
  my $x = ($i / 65536) % 256;
  my $y = ($i / 256) % 256;
  my $z = ($i) % 256;

  return "$w.$x.$y.$z"
}

sub changeSplit {
  my $n = scalar(@_);
  my $i = $_[0];
  $i =~ s/\\b/ /g;

  return "$i"
}

sub isNotBlank {
  my $tmp = $_[1];

  if(!$tmp) {
     return " "
  }else{
     return "$tmp"
  }
}


sub help {
    print "Usage: $0 -f file.json -d my-ip-data.mmdb\n";
    print 'Example json:
{
  "records": [
    {
      "address": "6.6.6.6/28",
      "service_area": "LAX"
    }
  ]
}' . "\n";
    exit;
};

