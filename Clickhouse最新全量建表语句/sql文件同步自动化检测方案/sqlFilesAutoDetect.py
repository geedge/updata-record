# -*- coding: utf-8 -
import os

newSqlFilePath = "Clickhouse_TSG_建表语句_new.sql" #新表文件路径
oldSqlFilePath = "Clickhouse_TSG_建表语句_old.sql" #旧表文件路径

shellCommand1 = "diff "+newSqlFilePath +" "+oldSqlFilePath#shell命令
shellCommand2 = "diff "+oldSqlFilePath +" "+newSqlFilePath#shell命令，左右表位置互换，可能有不同的对比结果
shellCommand = [shellCommand1,shellCommand2]

for s in range(0,len(shellCommand)):
    print shellCommand[s]+":"
    re = os.popen(shellCommand[s]).readlines()
    result = []
    isRight= False #未出现右箭头
    keyWord = ["PRIMARY"] #不能要的关键字
    isKeyWord =  False #表示当前列表未出现关键字
    for i in range(0, len(re)):  # 由于原始结果需要转换编码，所以循环转为utf8编码并且去除\n换行
        res = re[i].strip('\n')
        for j in range(0,len(keyWord)):
            if str(res).find(keyWord[j]) != -1:
                isKeyWord = True  # 表示res出现关键字
        if isRight == False and str(res).find(">", 0, 1) == 0:
            isRight = True
            result.append(res)
        elif isRight == True and str(res).find(">",0,1) == -1 :
            if isKeyWord ==False:
                print result
            result = []
            result.append(res)
            isRight = False
            isKeyWord = False
        else:
            result.append(res)
        if i == len(re) -1 :
            if isKeyWord == False:
                print result
            print ""







