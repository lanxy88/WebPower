package org.lanxy.webpower.core.web;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * .Action 基类
 *
 * @author <a href="mailto:lanxy88@gmail.com">wolfe</a>
 * @version V1.0, 12-3-1 下午5:12
 */
public class BaseAction implements Action {

    protected static final String CLIENT_FLEX = "_flex";
    protected static final String CLIENT_JAVASCRIPT = "_javascript";
    protected static final String CLIENT_FREEMARKER = "_freemarker";
    protected static final String CLIENT_JSP = "_jsp";
    protected static final String CLIENT_NORMAL = "_normal";

    private static final String CLIENT_TYPE= "clientType";


    /**
     * Where the logic of the action is executed.
     *
     * @return a string representing the logical result of the execution.
     *         See constants in this interface for a list of standard result values.
     * @throws Exception thrown if a system level exception occurs.
     *                   <b>Note:</b> Application level exceptions should be handled by returning
     *                   an error value, such as <code>Action.ERROR</code>.
     */
    public String execute() throws Exception {
        return Action.SUCCESS;
    }


    /**
     * 向客户端发送String
     * Flex ，jsAjax请求等
     * @param result
     * @return
     * @throws IOException
     */
    protected String sendString(String result) throws IOException
    {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.getWriter().write(result);
        return Action.NONE;
    }

    /**
     * 想页面发送哈希表
     * Freemarker，Jsp等
     * @param result
     * @return
     */
    protected String sendMap(Map<String,Object> result)
    {
        ActionContext.getContext().getSession().putAll(result);
        return Action.SUCCESS;
    }

    /**
     * 以JSON格式发送
     * @param param
     * @return
     */
    protected String sendJson(Object param) throws IOException {
        return sendString(renderJson(param));
    }

    /**
     * 转为JSON格式
     * @param param
     * @return
     */
    protected String renderJson(Object param)
    {
        return JSON.toJSONString(param);
    }

}
