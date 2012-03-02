<#macro select name list value="" disabled="">
<select name="${name}"<#if disabled=="disabled"> disabled="disabled"</#if>>
    <#list list?keys as x>
        <option value="${x}"<#if value==x> selected="selected"</#if>>${list[x]}</option>
    </#list>
</select>
</#macro>