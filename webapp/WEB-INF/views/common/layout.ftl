<#macro html title="" import="">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${title}</title>
    <#list import?split(",") as lib>
        <#switch lib>
            <#case "base">
            <@script name="js/base.js"/>
            <@style name="css/base.css"/>
                <#break/>
            <#case "main">
            <@script name="js/main.js"/>
            <@style name="css/main.css"/>
                <#break/>
            <#case "admin">
            <@script name="js/admin.js"/>
            <@style name="css/admin.css"/>
            <@script name="js/datePicker/WdatePicker.js"/>
                <#break/>
            <#case "jquery">
            <@script name="js/jquery.js"/>
                <#break/>
            <#case "form">
            <@style name="css/validation.css"/>
            <@script name="js/validation.js"/>
            <@script name="js/datePicker/WdatePicker.js"/>
                <#break/>
            <#case "ext">
            <@style name="js/ext/resources/css/ext-all.css"/>
            <@style name="js/ext/resources/css/xtheme-gray.css"/>
            <@script name="js/ext/ext-base.js"/>
            <@script name="js/ext/ext-all.js"/>
            <@script name="js/ext/ext-lang-zh_CN.js"/>
                <script language="javascript">Ext.BLANK_IMAGE_URL = "${base}/js/ext/resources/images/default/s.gif";</script>
        </#switch>
    </#list>
</head>
<body>
    <#nested/>
</body>
</html>
</#macro>

<#macro print>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<@style name="css/print.css"/>
</head>
<body>
<object id="webPrint" height="0" width="0" classid="clsid:DC2A3C42-24DC-4FD6-836A-A2E8594ABC15" codebase="ocx/ReYoPrint.CAB#version=2009,1215,0,858"></object>
<script type="text/javascript">
    if (!webPrint.defaultPrinterName) {
        document.write('<div style="margin:10px;font-size:16px;"><a href="ocx/ReYoPrint.zip">未找到打印控件，请下载安装</a></div>');
    }
</script>
    <#nested/>
</body>
</html>
</#macro>

<#macro export>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<script type="text/javascript">
</script>
    <#nested/>
</body>
</html>
</#macro>

<#macro main title="国图档案管理系统" import="">
<@html title=title import="${import},base,main">
<div id="container">
    <#if !hideBanner?? || !hideBanner>
        <div id="header" class="clearfix header${ctx.hasEnv('xian.enable')?string(' header-xian','')}">
            <#if a3d??>
                <div id="top-mode">
                    <a href="index.action" class="btn mode-normal<#if !a3d> active</#if>"></a>
                    <a href="index!a3d.action" class="btn mode-3d<#if a3d> active</#if>"></a>
                    <#if a3d><a href="3d/index.jsp" class="max" target="_blank">最大化</a></#if>
                </div>
            </#if>
            <div id="top-menu">
                <a href="index.action">首页</a> | <a href="logout.action">注销</a>
            </div>
        </div>
        <#else>
            <div class="header-hide"><a href="index.action">首页</a></div>
    </#if>
    <div id="tbody">
        <#nested/>
    </div>
    <div id="footer">&copy;2010 档案管理系统</div>
</div>
</@html>
</#macro>

<#macro admin title="国图档案管理系统管理工具" import="">
<@html title=title import="jquery,base,admin,${import}">
<div id="container">
    <div id="header" class="clearfix">
        <div id="top-menu">
            <a href="${base}/index.action">首页</a> | <a href="${base}/logout.action">注销</a>
        </div>
    </div>
    <div id="tbody">
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td id="side-menu">
                    <ul>
                        <li${(tab??&&tab=='model')?string(' class="current"','')}><a href="${base}/admin/model.action" class="icon1">业务管理</a></li>
                        <li${(tab??&&tab=='dict')?string(' class="current"','')}><a href="${base}/admin/dict.action" class="icon2">字典管理</a></li>
                        <li${(tab??&&tab=='tree')?string(' class="current"','')}><a href="${base}/admin/tree.action">分类管理</a></li>
                        <li${(tab??&&tab=='permission')?string(' class="current"','')}><a href="${base}/admin/permission.action">权限管理</a></li>
                        <li${(tab??&&tab=='ajh')?string(' class="current"','')}><a href="${base}/admin/ajh.action">案卷号管理</a></li>
                        <li${(tab??&&tab=='props')?string(' class="current"','')}><a href="${base}/admin/props.action">变量管理</a></li>
                        <li><a href="${ctx.env['solr.url']}/console.do" target="_blank">索引管理</a></li>
                        <#if ctx.hasEnv('xian.enable')><li${(tab??&&tab=='og')?string(' class="current"','')}>
                        <li${(tab??&&tab=='sq')?string(' class="current"','')}><a href="${base}/admin/xian/sq.action">授权列表</a></li>
                        <li${(tab??&&tab=='dl')?string(' class="current"','')}><a href="${base}/admin/xian/dl.action">操作日志</a></li>
                        <li${(tab??&&tab=='kybg')?string(' class="current"','')}><a href="${base}/admin/xian/kybg.action">可研报告管理</a></li>
                        <li${(tab??&&tab=='kgda')?string(' class="current"','')}><a href="${base}/admin/xian/kgda.action">控规档案管理</a></li></#if>
                    </ul>
                </td>
                <td id="content"><#nested/></td>
            </tr>
        </table>
    </div>
    <div id="footer">&copy;2010 国图档案管理系统</div>
</div>
</@html>
</#macro>

<#macro form title="" import="">
<@html title=title import="base,jquery,form,${import}">
    <#nested/>
<script type="text/javascript">
    $(function() {
        $("form").validationEngine();
        if (parent.onResize)
            parent.onResize(document.documentElement.scrollWidth, document.documentElement.scrollHeight);
    });
    function doSubmit() {
        $("form").submit();
    }
    function getArchiveId(){
        return $("form")[0].id.value;
    }
</script>
</@html>
</#macro>

<#macro script name>
<script src="${base}/${name}" type="text/javascript"></script>
</#macro>

<#macro style name>
<link href="${base}/${name}" type="text/css" media="screen" rel="stylesheet"/>
</#macro>