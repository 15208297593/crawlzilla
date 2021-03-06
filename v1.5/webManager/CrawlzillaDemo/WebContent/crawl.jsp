<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/i18n-1.0" prefix="i18n"%>
<%@ page import="java.util.*"%>
<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<%@ include file="/include/header.jsp"%>

<%
String loginFormURL = "login.jsp";
String user = (String) session.getAttribute("userName");
	if (session.getAttribute("loginFlag") == "true") {
		System.out.println("has been login!");
		String userName = session.getAttribute("userName").toString();
		String lang = session.getAttribute("language").toString();
		Locale locale = new Locale(lang);
%>
<i18n:bundle baseName="org.nchc.crawlzilla.i18n.lang"
		locale="<%=locale%>" id="bundle" />
<title><i18n:message key="crawl_setup" /></title>
<body id="www-url-cz">
<script>
	$(function() {
		$( "#datepicker" ).datepicker();
		$( "#format" ).change(function() {
			$( "#datepicker" ).datepicker( "option", "dateFormat", $( this ).val() );
		});
	});
	
	$(function() {
		// run the currently selected effect
		function runEffect() {
			// get effect type from 
			var selectedEffect = "bounce";

			// most effect types need no options passed by default
			var options = {};
			// run the effect
			$( "#effect" ).show( selectedEffect, options, 500, callback );
		};

		//callback function to bring a hidden box back
		function callback() {
			setTimeout(function() {
				$( "#effect:visible" ).removeAttr( "style" ).fadeOut();
			}, 30000 );
		};

		// set effect from select menu value
		$( "#button" ).click(function() {
			runEffect();
			return false;
		});

		$( "#effect" ).hide();
	});

	$(function() {
		$( "#accordion" ).accordion();
	});	
</script>

<style>
	.toggler { width: 500px; height: 200px; }
	#button { padding: .5em 1em; text-decoration: none; }
	#effect { width: 420px; height: 170px; padding: 0.4em; position: relative; }
	#effect h3 { margin: 0; padding: 0.4em; text-align: center; }
</style>

<hr class="noscreen" />
<p id="breadcrumbs">&nbsp;</p>
<hr class="noscreen" />
</div> <!-- /strip -->
<div id="content">
	<div id=home>
		<div class="article">
			<h2><i18n:message key="crawl_createEngine" /></h2>
            <p>&nbsp;</p>
            <div id="accordion">
            
         	<h3><a href="#">Crawl Setup</a></h3>
            <div>
                <form id="form1" method="post" action="Crawl.do">
                <p class="info noprint"><i18n:message key="crawl_poolName" />
     			<label for="textfield"></label>
                <input type="text" name="IDBName" id="textfield" /></p>
				<p class="info noprint"><i18n:message key="crawl_inputWebsite" />
				<p class="info noprint">
  					<label for="textfield2"></label>
  					<textarea name="crawlUrls" cols="40" rows="5" id="textfield2"></textarea>
				</p>
				<p class="info noprint"><i18n:message key="crawl_depthSetup" />
  					<label for="select"></label>
  					<select name="depth" id="select">
  					<%
  						for(int i=1; i <= 6; i++){
  							out.print("<option value=\"" + i +"\">" + i + "</option>");
  						}
  					%>
  					</select><p>
  					<i18n:message key="crawl_message" />
				</p>
			</div>
<h3><a href="#"><i18n:message key="crawl_orderSetup" /></a></h3>
<!--<h2>&nbsp;排程設定(Option)</h2> -->
<div>
		<p class="info noprint"><i18n:message key="crawl_orderDate" />：
			<input name="schDate" id="datepicker" type="text">
		</p>
		<p class="info noprint"><i18n:message key="crawl_orderTime" />：
  			<label for="select3"></label>
  			<select name="schHour" size="1" id="select3"> 
  			<option value=""><i18n:message key="crawl_select" /></option> 
  			<%
  				for(int i=0; i <= 23; i++){
  					out.print("<option value=\"" + i + "\">" + ((i < 10)? "0" : "") +  i +"</option>");
  				}
  			%>
   	 			
    		</select> Hour 
  			<label for="select4"></label>
  			<select name="schMin" id="select4">
  			<option value=""><i18n:message key="crawl_select" /></option> 
  			<%
  				for(int i=0; i <=60; i++){
  					out.print("<option value=\"" + i + "\">" + ((i < 10)? "0" : "") +  i +"</option>");
  				}
  			%>
  			</select> Minute
		</p>
   		<p class="info noprint"><i18n:message key="crawl_freq" />
 		<label for="select2"></label>
  	  	<select name="freq" id="select2">
    		<option value="once"><i18n:message key="crawl_once" /></option>
        	<option value="daily"><i18n:message key="crawl_daily" /></option>
        	<option value="weekly"><i18n:message key="crawl_weekly" /></option>
       	 	<option value="monthly"><i18n:message key="crawl_monthly" /></option>
    	</select>
    	<a href="#" id="button" class="ui-state-default ui-corner-all"><i18n:message key="crawl_explain" /></a>
    	<p class="info noprint">	
    	<div id="effect" class="ui-widget-content ui-corner-all">
			<h3 class="ui-widget-header ui-corner-all"><i18n:message key="crawl_freqExplain" /></h3>
			<p><i18n:message key="crawl_onceEx" /> </p>
        	<p><i18n:message key="crawl_dailyEx" /> </p>
        	<p><i18n:message key="crawl_weeklyEx" /> </p>
        	<p><i18n:message key="crawl_monthlyEx" /> </p>
		</div>            
		<p>
	</div>
	</div> <!--id="accordion"> -->
	<p>
		<input type="submit" name="button3" id="button3" value="Submit" />
    	<input type="reset" name="button2" id="button2" value="Reset" />
    </p>       
    </form>
   	</div> <!-- /article -->
</div> <!-- home --><!-- crawl -->       
<hr class="noscreen" />                    
<hr class="noscreen" />
</div> <!-- /content -->
<div id="col" class="noprint">
<div id="col-in">
<%@ include file="/include/rightside.jsp"%>
<hr class="noscreen" />
</div> <!-- /col-in -->
</div> <!-- /col -->
</div> <!-- /page-in -->
</div> <!-- /page -->
<%@ include file="/include/footer.jsp"%>
<%
	} else { 
%>
		<br><i18n:message key="public_nonlogin" /></br>
<%
response.setHeader("Refresh", "5; URL=" + loginFormURL);
	 }
%>

</body>
</html>