<?php
if(!defined('CAN_RUN')) {
	exit('Access Denied');
}

class backup_passwd_log_set extends base_set {
	protected $table_name = 'backup_passwd_log';
	protected $id_name = 'seq';

	
}