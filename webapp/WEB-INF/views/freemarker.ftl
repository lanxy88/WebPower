<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
</head>
<body>
    <#include "header.ftl">

    <#--${root}-->

    <#--<#assign lists>${root.lists}</#assign>-->

    ${(kk.momo)!0}

    <#if name??><a>name:${name}</a></#if>
    <#if today??><a>today:${today}</a></#if>
    <#if bb??><a>bb${bb}</a></#if>
    <a>当前时间${.now}</a>
    <br/>
    <ul>
        <#list lists as item>
            <li><a>${item}</a>.<a>${item_index}</a>
                <#if item_has_next>,
                <#else>
                    .<#break >.
                </#if>
            </li>
        </#list>
    </ul>

    ${name?cap_first}
    ${name?upper_case}

    <br/>
    <#noparse>
        <#list>
            <a>asd</a>
        </#list>
    </#noparse>

    <#assign x = "<sss>" >
    <#macro m1>
        m1:${x}
    </#macro>

    <#escape x as x?html>
        <@m1/>
    </#escape>
    <@m1/>

    <#assign animal="dog">
    <#if animal=="dog">
        wangwang
        <#else>
        gg
    </#if>

</body>
</html>