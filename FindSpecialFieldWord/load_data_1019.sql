# create table
DROP TABLE if EXISTS order_base;
CREATE TABLE IF NOT EXISTS order_base(
id                 INT         COMMENT  '自增ID',      
order_sn           STRING      COMMENT  '订单编号',
user_id            INT         COMMENT  '用户ID',
shop_id            INT         COMMENT  '店铺ID',
add_time           INT         COMMENT  '下单时间',
pay_time           INT         COMMENT  '付款时间',
delivery_name      STRING      COMMENT  '收件人姓名',
delivery_address   STRING      COMMENT  '收件人地址',
delivery_phone     STRING      COMMENT  '收件人电话'
)COMMENT '订单基本信息表'
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' 
STORED AS TEXTFILE;


# load data
load data local inpath './order_data.txt' overwrite into table order_base;