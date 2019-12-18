# addrbook
PNU ITE WebProgramming make addrbook and etc..

## 1. GCP 이용하기
Google Cloud Platform - GCP에 관한 설명은 https://cloud.google.com/gcp/?utm_source=google&utm_medium=cpc&utm_campaign=japac-KR-all-en-dr-bkws-all-all-trial-e-dr-1003987&utm_content=text-ad-none-none-DEV_c-CRE_255885830771-ADGP_Hybrid+%7C+AW+SEM+%7C+BKWS+~+T1+%7C+EXA+%7C+General+%7C+M:1+%7C+KR+%7C+en+%7C+cloud+%7C+platform-KWID_43700020285731386-kwd-301388847745&userloc_1030753&utm_term=KW_gcp&gclid=Cj0KCQiAuefvBRDXARIsAFEOQ9EqzaAhJsN5mM50Iz3P7hf7S10DnrCCLRz7Mwz1NpwpiiC1-stLTMYaArXbEALw_wcB  에서 보실 수 있습니다.

![VM캡처2](https://user-images.githubusercontent.com/38112724/71100684-cb061180-21f8-11ea-8f4a-e5e1a40555af.PNG)

GCP에서 여러 기능들을 지원하지만, 이 프로젝트에선 JSP를 호스팅할 톰캣 서버를 열어줄 VM이 필요합니다.
원하는 스펙의 VM 을 만들고, 외부IP를 걸어준 후 SSH버튼을 눌러 SSH접속을 실행합니다.
![VM SSH 접속 완료](https://user-images.githubusercontent.com/38112724/71100946-3ea81e80-21f9-11ea-836c-4b9ee6f51981.PNG)
접속하면 해당 VM을 이용할 수 있는 콘솔이 생기며, 여기서 tomcat 서버 설치와 jsp개발을 진행하면 됩니다.
저 같은 경우 외부 IP를 34.85.53.172로 배정받았기에 http://34.85.53.172 이런 식으로 접속을 할 수 있습니다.

![방화벽 규칙](https://user-images.githubusercontent.com/38112724/71101407-00f7c580-21fa-11ea-8864-49127d5aeda2.PNG)
방화벽 규칙도 하나 추가하면 http://34.85.53.172:8080/jspbook/addrbook/index.jsp 와 같이 포트 8080으로 접속이 가능합니다. 본 프로젝트에 꼭 필요한 방화벽 규칙입니다.



