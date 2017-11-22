package com.panda.shiro;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Created with IDEA. 自定义 Permissions
 * User: Alan
 * Date: 2017/11/22
 * Time: 17:07
 */
public class AnyPermissionsAuthorizationFilter extends AuthorizationFilter {

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        Subject subject = getSubject(request, response);

        String[] perms = (String[]) mappedValue;
        if (perms != null && perms.length > 0){
            for (String perm : perms) {
                if (subject.isPermitted(perm)) {
                    return true;
                }
            }
        }
        return true;
    }
}
