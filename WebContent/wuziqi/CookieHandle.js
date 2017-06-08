/**
 * cookieHandle: ����cookie���������ķ�װ
 * date: 2013.1.10
 * author: Seven
**/
var cookieHandle = {
    //��ȡcookie��name��Ӧ��ֵ
    getCookie: function (name) {
        var cookies = document.cookie.split("; "),
            arr;
        for (var i = 0, len = cookies.length; i < len;i++) {
            arr = cookies[i].split("=");
            if(arr[0] == encodeURIComponent(name)) {
                return decodeURIComponent(arr[1]);
            }
        }
        return "";
    },
    // ����cookie
    // option.name: cookie������ѡ
    // option.value: cookieֵ����ѡ
    // option.expiresHours: ����ʱ�䣬��ѡ��Ĭ��Ϊ������رռ���ʧ
    // option.path: cookie���·������ѡ������"/"��"/shop"��
    // Ĭ������£������ĳ��ҳ�洴����һ��cookie����ô��ҳ������Ŀ¼�е�����ҳ��Ҳ���Է��ʸ�cookie��
    // ������Ŀ¼�»�����Ŀ¼��������Ŀ¼��Ҳ���Է��ʡ�
    // ������www.xxxx.com/html/a.html����������cookie��
    // ���Ա�www.xxxx.com/html/b.html��www.xxx.com/html/some/c.html�����ʣ������ܱ�www.xxxx.com/d.html���ʡ�
    // option.domain: �ɷ��ʸ�cookie����������ѡ��
    setCookie: function (option) {
        var cookieStr = encodeURIComponent(option.name) + "=" + encodeURIComponent(option.value);
        if (option.expiresHours) {
            var date = new Date();
            date.setTime(date.getTime() + option.expiresHours * 3600 * 1000);
            cookieStr = cookieStr + "; expires=" + date.toUTCString();
        }
        if (option.path) {
            cookieStr = cookieStr + "; path=" + option.path;
        }
        if (option.domain) {
            cookieStr = cookieStr + "; domain=" + option.domain;
        }
        document.cookie = cookieStr;
    },
    // ɾ��cookie
    // name: cookie������ѡ
    // option.path: cookie���·������ѡ
    // option.domain: �ɷ��ʸ�cookie����������ѡ
    // ��Ҫע����ǣ�����cookieʱ�����setCookie����path��domain��ɾ��ʱҲ��ѡ���������������������޷�ɾ��cookie
    // ���⣬�����ԣ���������path��domain��ɾ��ʱ��������cookie��ͬһ����ɾ��
    deleteCookie: function (name, option) {
        var date = new Date(0);
        document.cookie = name + "=88; expires=" + date.toUTCString() +
                            (option.path ? ("; path=" + option.path) : "") +
                            (option.domain ? ("; domain=" + option.domain) : "");
    }
};