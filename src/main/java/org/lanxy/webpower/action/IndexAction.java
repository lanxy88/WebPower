package org.lanxy.webpower.action;

import org.lanxy.webpower.core.web.BaseAction;

import java.util.HashMap;
import java.util.Map;

/**
 * .
 *
 * @author <a href="mailto:lanxy88@gmail.com">wolfe</a>
 * @version V1.0, 12-3-2 下午2:36
 */
public class IndexAction extends BaseAction {

    @Override
    public String execute() throws Exception {
        Map<String,Object> result = new HashMap();
        result.put("userName","Lanxy");

        return sendJson(result);
    }
}
