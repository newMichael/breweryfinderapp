<?php

define('EMAIL_FOR_REPORTS', '');
define('RECAPTCHA_PRIVATE_KEY', '@privatekey@');
define('FINISH_URI', 'http://localhost:8080/capstone/register');
define('FINISH_ACTION', 'redirect');
define('FINISH_MESSAGE', 'Thanks for filling out my form!');
define('UPLOAD_ALLOWED_FILE_TYPES', 'doc, docx, xls, csv, txt, rtf, html, zip, jpg, jpeg, png, gif');

define('_DIR_', str_replace('\\', '/', dirname(__FILE__)) . '/');
require_once _DIR_ . '/handler.php';

?>

<?php if (frmd_message()): ?>
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-biz-red.css" type="text/css" />
<span class="alert alert-success"><?php echo FINISH_MESSAGE; ?></span>
<?php else: ?>
<!-- Start Formoid form-->
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-biz-red.css" type="text/css" />
<script type="text/javascript" src="<?php echo dirname($form_path); ?>/jquery.min.js"></script>
<form class="formoid-biz-red" style="background-color:#1A2223;font-size:14px;font-family:'Open Sans','Helvetica Neue', 'Helvetica', Arial, Verdana, sans-serif;color:#ECECEC;max-width:768px;min-width:150px" method="post"><div class="title"><h2>Brewery Account Request </h2></div>
	<div class="element-input<?php frmd_add_class("input1"); ?>"><label class="title"><span class="required">*</span></label><input class="large" type="text" name="input1" required="required" placeholder="Username"/></div>
	<div class="element-password<?php frmd_add_class("password"); ?>"><label class="title"><span class="required">*</span></label><input class="large" type="password" name="password" value="" required="required" placeholder="Password"/></div>
	<div class="element-password<?php frmd_add_class("password1"); ?>"><label class="title"><span class="required">*</span></label><input class="large" type="password" name="password1" value="" required="required" placeholder="Confirm Password"/></div>
	<div class="element-email<?php frmd_add_class("email"); ?>"><label class="title"><span class="required">*</span></label><input class="large" type="email" name="email" value="" required="required" placeholder="Email"/></div>
	<div class="element-name<?php frmd_add_class("name"); ?>"><label class="title"><span class="required">*</span></label><span class="nameFirst"><input placeholder="Name First" type="text" size="8" name="name[first]" required="required"/></span><span class="nameLast"><input placeholder="Name Last" type="text" size="14" name="name[last]" required="required"/></span></div>
	<div class="element-input<?php frmd_add_class("input2"); ?>"><label class="title"><span class="required">*</span></label><input class="large" type="text" name="input2" required="required" placeholder="Name of Brewery"/></div>
	<div class="element-phone<?php frmd_add_class("phone"); ?>"><label class="title"><span class="required">*</span></label><input class="large" type="tel" pattern="[+]?[\.\s\-\(\)\*\#0-9]{3,}" maxlength="24" name="phone" required="required" placeholder="Brewery Phone Number" value=""/></div>
<div class="submit"><input type="submit" value="Submit"/></div></form><script type="text/javascript" src="<?php echo dirname($form_path); ?>/formoid-biz-red.js"></script>

<!-- Stop Formoid form-->
<?php endif; ?>

<?php frmd_end_form(); ?>