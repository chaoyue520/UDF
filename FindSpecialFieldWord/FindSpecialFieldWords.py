#!/usr/bin/python

import sys

# \u5927\u5b66 是大学字段的utf-8形式
for line in sys.stdin:
    order_sn, delivery_address = line.strip().split("\t")

    found = "N"
    pos = delivery_address.decode("utf8").find(u'\u5927\u5b66')
    if(pos > -1):
        found = "Y"
    print "\t".join([order_sn, delivery_address, found])



#使用 Python 实现的 UDF 完成后，需要通过 ADD FILE 指令添加至 Hive 中进行注册，无需起别名：
hive> ADD FILE ./FindSpecialFieldWords.py




