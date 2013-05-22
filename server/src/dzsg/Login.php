<?php
class Login
{
	/**
	 * 注册user账户
	*/
	public function register($name, $pwd, $money = 100)
	{
		$con = mysql_connect('localhost', 'root', '');
		if(!$con)
		{
			die('could not connect: ' . mysql_error());
		}
		mysql_select_db('dzsg', $con);
		//$md5_pwd = md5($pwd);
		mysql_query("INSERT INTO t_user (id, name, pwd, money) VALUES ('', '$name', '$md5_pwd', '$money')");
		mysql_close($con);
		return array('name'=>$name, 'pwd'=>$pwd, 'md5_pwd'=>$md5_pwd, 'money'=>$money);
	}
	
	public function createRole($familyname, $lastname, $sex, $avatarid)
	{
	
	}
	
	public function test()
	{
		return array('state'=>1, 'msg'=>'test');
	}
	
	public function test2($name)
	{
		return array('state'=>1, 'msg'=>'test2'.$name);
	}
	
	public function userLogin($name, $pwd)
	{
		if(strlen($name) < 3 || strlen($pwd) != 32)
		{
			return array('state'=>0, 'msg'=>'login format error');
		}
		$con = mysql_connect('localhost', 'root', '');
		if(!$con)
		{
			die('could not connect: ' . mysql_error());
		}
		mysql_select_db('dzsg', $con);
		$sqlStr = "select * from t_user where 'name' = '$name'";
		$result = mysql_query($sqlStr);
		$row = mysql_fetch_array($result);
		if($row['name'] == $name && $row['pwd'] == $pwd)
		{
			$backarr = array('state'=>1, 'msg'=>'登录成功');
		}
		else
		{
			$backarr = array('state'=>0, 'msg'=>'帐号密码错误');
		}
		mysql_close($con);
		return $backarr;
	}
	
}


?>