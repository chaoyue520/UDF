# Python 实现的 UDF 就可以通过 TRANSFORM...AS 在 HiveQL 中使用

SELECT TRANSFORM (<columns>)
USING 'python <python_script>'
AS (<columns>)
FROM <table>;

#其中， SELECT 中的 columns 是 FROM 中 table 的列名， 而 AS 中的 columns 是经过 USING 中 Python 脚本 python_script 计算返回的列名。



# 查找包含指定关键字的 HiveQL 脚本如下：
SELECT t2.order_sn, t2.delivery_address,t2.found
FROM
(SELECT TRANSFORM (t1.order_sn, t1.delivery_address) 
USING 'python FindSpecialFieldWords.py' 
AS (order_sn STRING, delivery_address STRING, found STRING)
FROM order_base t1) t2
WHERE t2.found = 'Y';