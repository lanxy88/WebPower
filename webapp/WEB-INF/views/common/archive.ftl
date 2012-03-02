<#macro archive>
<@layout.form>
<@s.form action="archive-entity!save" cssClass="a-form">
<@s.hidden name="modelName"/>
<@s.hidden name="treeId"/>
<@s.hidden name="id"/>
<@s.hidden name="documentId"/>
<#if ajhRange??>
<@s.hidden name="ajhRange.id"/>
<@s.hidden name="ajhRange.currentValue"/>
</#if>
<#nested/>
</@s.form>
</@layout.form>
</#macro>

<#macro document>
<@layout.form>
<@s.form action="doc-entity!save" cssClass="a-form">
<@s.hidden name="modelName"/>
<@s.hidden name="id"/>
<@s.hidden name="archiveId"/>
<#nested/>
</@s.form>
</@layout.form>
</#macro>

<#macro note>
<@layout.form>
<@s.form action="note-entity!save" cssClass="a-form">
<@s.hidden name="modelName"/>
<@s.hidden name="id"/>
<@s.hidden name="archiveId"/>
<#nested/>
</@s.form>
</@layout.form>
</#macro>

<#macro loan>
<@layout.form>
<@s.form action="loan-entity!save" cssClass="a-form">
<@s.hidden name="modelName"/>
<@s.hidden name="id"/>
<@s.hidden name="archiveId"/>
<#nested/>
</@s.form>
</@layout.form>
</#macro>

<#macro metadata>
<@layout.form>
<@s.form action="metadata-entity!save" cssClass="a-form">
<@s.hidden name="id"/>
<@s.hidden name="archiveId"/>
<#nested/>
</@s.form>
</@layout.form>
</#macro>

<#macro title name>${fields[name].title}</#macro>

<#macro text name style="" class="" size="" attrs={} readonly="readonly">
<#if fields[name]??>
<#assign _f=fields[name]/>
<input name="${name}" id="f-${name}" value="${.vars[name]!}"<#if style!=""> style="${style}"</#if> class="text<#if class!=""> ${class}</#if><#if _f.validation?? && _f.validation!=""> validate[${_f.validation}]</#if>"<#if size!=""> class="${size}"</#if><#list attrs?keys as _attr> ${_attr}="${attrs[_attr]}"</#list><#--<#if name="qzh"> readonly="${readonly}"</#if> <#if name="flh"> readonly="${readonly}"</#if>-->/>
</#if>
</#macro>

<#macro textarea name style="" class="" cols="" rows="3" attrs={}>
<#if fields[name]??>
<#assign _f=fields[name]/>
<textarea name="${name}" id="f-${name}" <#if style!=""> style="${style}"</#if> class="textarea<#if class!=""> ${class}</#if><#if _f.validation?? && _f.validation!=""> validate[${_f.validation}]</#if>"<#if cols!=""> cols="${cols}"</#if><#if rows!=""> rows="${rows}"</#if><#list attrs?keys as _attr> ${_attr}="${attrs[_attr]}"</#list>>${.vars[name]!}</textarea>
</#if>
</#macro>

<#macro number name style="" class="" size="" attrs={}>
<#if fields[name]??>
<#assign _f=fields[name]/>
<input name="${name}" id="f-${name}" value="${.vars[name]!}"<#if style!=""> style="${style}"</#if> class="number<#if class!=""> ${class}</#if><#if _f.validation?? && _f.validation!=""> validate[${_f.validation}]</#if>"<#if size!=""> size="${size}"</#if><#list attrs?keys as _attr> ${_attr}="${attrs[_attr]}"</#list> onkeyup="replaceNum(this);"/>
</#if>
</#macro>

<#macro date name style="" class="" size="" format="yyyy-MM-dd" attrs={}>
<#if fields[name]??>
<#assign _f=fields[name]/>
<#assign _v=.vars[name]!/>
<#if _v?is_date><#assign _v=_v?string(format)/></#if>
<input name="${name}" id="f-${name}" value="${_v}"<#if style!=""> style="${style}"</#if> class="date Wdate<#if class!=""> ${class}</#if><#if _f.validation?? && _f.validation!=""> validate[${_f.validation}]</#if>"<#if size!=""> class="${size}"</#if><#list attrs?keys as _attr> ${_attr}="${attrs[_attr]}"</#list> onclick="WdatePicker({dateFmt:'${format}'});"/>
</#if>
</#macro>

<#macro select name style="" class="" size="" attrs={}>
<#if fields[name]??>
<#assign _f=fields[name]/>
<#assign _v=.vars[name]!/>
<select name="${name}" id="f-${name}" <#if style!=""> style="${style}"</#if> class="select<#if class!=""> ${class}</#if><#if _f.validation?? && _f.validation!=""> validate[${_f.validation}]</#if>"<#if size!=""> class="${size}"</#if><#list attrs?keys as _attr> ${_attr}="${attrs[_attr]}"</#list>>
<option value="">---</option>
<#if _f.valueDict?? && _f.valueDict!=''>
<#assign _list=_dict[_f.valueDict]/>
<#if _list??>
    <#list _list as _item>
    <option value="${_item.name}"<#if .vars[name]?? && (.vars[name]==_item.value ||.vars[name]==_item.name)> selected="selected"</#if>>${_item.name!_item.value}</option>
    </#list>
</#if>
</#if>
</select>
</#if>
</#macro>