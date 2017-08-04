#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb

def baseopt():
	# 打开数据库连接
	db = MySQLdb.connect("localhost","root","juzi","startgo")

	# 使用cursor()方法获取操作游标 
	cursor = db.cursor()

	# 使用execute方法执行SQL语句
	cursor.execute("SELECT VERSION()")

	#=====================================================================

	# 使用 fetchone() 方法获取一条数据库。
	data = cursor.fetchone()
	print "Database version : %s " % data

	# 如果数据表已经存在使用 execute() 方法删除表。
	cursor.execute("DROP TABLE IF EXISTS rshit")

	#=====================================================================
	# 创建数据表SQL语句
	sql = """CREATE TABLE rshit (
			NAME CHAR(20) NOT NULL,
			GRAGUATEYEAR INT,  
			SEX CHAR(8),
			QUALIFICATIONS CHAR(20))"""

	cursor.execute(sql)

	#=====================================================================
	# SQL 插入语句
	sql = """INSERT INTO rshit(NAME,
			GRAGUATEYEAR, SEX, QUALIFICATIONS)
			VALUES ('liuzhch', 2014, 'male', 'master')"""
	try:
		# 执行sql语句
		cursor.execute(sql)
		# 提交到数据库执行
		db.commit()
	except:
		# Rollback in case there is any error
		print "error occurred during inserting"
		db.rollback()

	# SQL 插入语句 with variables
	sql = "INSERT INTO rshit(NAME, \
			GRAGUATEYEAR, SEX, QUALIFICATIONS) \
			VALUES ('%s', '%d', '%s', '%s')" % \
			('chenwen', 2015, 'male', 'master')
	try:
		# 执行sql语句
		cursor.execute(sql)
		# 提交到数据库执行
		db.commit()
	#except BaseException, reason:
	except Exception, reason:
		# Rollback in case there is any error
		print "error occurred during inserting"
		print reason
		db.rollback()


	#=====================================================================
	# SQL 查询语句
	sql = "SELECT * FROM rshit \
			WHERE GRAGUATEYEAR > '%d'" % (2014)
	try:
		# 执行SQL语句
		cursor.execute(sql)
		# 获取所有记录列表
		results = cursor.fetchall()
		for row in results:
			name = row[0]
			graduateyear = row[1]
			sex = row[2]
			qualifications = row[3]
			# 打印结果
			print "name=%s,graduateyear=%d,sex=%s,qualifications=%s" % \
				(name, graduateyear, sex, qualifications)
	except:
		print "Error: unable to fecth data"


	#=====================================================================
	# SQL 更新语句
	sql = "UPDATE rshit SET GRAGUATEYEAR = GRAGUATEYEAR + 1 WHERE SEX = '%s'" % ('male')
	try:
		# 执行SQL语句
		cursor.execute(sql)
		# 提交到数据库执行
		db.commit()
	except :
		# 发生错误时回滚
		print "error occurred when update"
		db.rollback()


	#=====================================================================
	# SQL 删除语句
	sql = "DELETE FROM rshit WHERE GRAGUATEYEAR > '%d'" % (2015)
	try:
		# 执行SQL语句
		cursor.execute(sql)
		# 提交修改
		db.commit()
	except:
		# 发生错误时回滚
		db.rollback()

	#=====================================================================

	# 关闭数据库连接
	db.close()
baseopt()