package com.igou.Interrupte;

import com.igou.app.pojos.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/11.
 */
public class UserInterrupte extends MethodFilterInterceptor {

    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
//        ActionContext actionContext = ActionContext.getContext();
//        Map<String, Object> session = actionContext.getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        if(session.getAttribute("LOGIN_NAME") == null){
            return "login";
        }else {
            return actionInvocation.invoke();
        }
    }
}
