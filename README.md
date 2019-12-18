# addrbook
PNU ITE WebProgramming make addrbook and etc..

## 1. GCP 이용하기
Google Cloud Platform - GCP에 관한 설명은 https://cloud.google.com/gcp/?utm_source=google&utm_medium=cpc&utm_campaign=japac-KR-all-en-dr-bkws-all-all-trial-e-dr-1003987&utm_content=text-ad-none-none-DEV_c-CRE_255885830771-ADGP_Hybrid+%7C+AW+SEM+%7C+BKWS+~+T1+%7C+EXA+%7C+General+%7C+M:1+%7C+KR+%7C+en+%7C+cloud+%7C+platform-KWID_43700020285731386-kwd-301388847745&userloc_1030753&utm_term=KW_gcp&gclid=Cj0KCQiAuefvBRDXARIsAFEOQ9EqzaAhJsN5mM50Iz3P7hf7S10DnrCCLRz7Mwz1NpwpiiC1-stLTMYaArXbEALw_wcB  에서 보실 수 있습니다.

![VM캡처2](https://user-images.githubusercontent.com/38112724/71100684-cb061180-21f8-11ea-8f4a-e5e1a40555af.PNG)

GCP에서 여러 기능들을 지원하지만, 이 프로젝트에선 JSP를 호스팅할 톰캣 서버를 열어줄 VM이 필요합니다.
원하는 스펙의 VM 을 만들고, 외부IP를 걸어준 후 SSH버튼을 눌러 SSH접속을 실행합니다.
![VM SSH 접속 완료](https://user-images.githubusercontent.com/38112724/71100946-3ea81e80-21f9-11ea-836c-4b9ee6f51981.PNG)
접속하면 해당 VM을 이용할 수 있는 콘솔이 생기며, 여기서 tomcat 서버 설치와 jsp개발을 진행하면 됩니다.
저 같은 경우 외부 IP를 34.85.53.172로 배정받았기에 해당 주소로 접근 가능합니다.

![방화벽 규칙](https://user-images.githubusercontent.com/38112724/71101407-00f7c580-21fa-11ea-8864-49127d5aeda2.PNG)
방화벽 규칙도 하나 추가하면 http://34.85.53.172:8080/jspbook/addrbook/index.jsp 와 같이 포트 8080으로 접속이 가능합니다. 본 프로젝트에 꼭 필요한 방화벽 규칙입니다.

이후 개개인에게 필요한 버전의 tomcat, java, DB등을 설치한 후 프로젝트를 진행하면 됩니다.

## 2. github.io 개인 블로그 만들기
https://github.com/Sylvy0815/Sylvy0815.github.io 의 README.md 참고

# Particle Jekyll Theme

![](./particle.jpg)

This is a simple and minimalist template for Jekyll designed for developers that want to show of their portfolio.

The Theme features:

- Gulp
- SASS
- Sweet Scroll
- Particle.js
- BrowserSync
- Font Awesome and Devicon icons
- Google Analytics
- Info Customization

## Basic Setup

1. [Install Jekyll](http://jekyllrb.com)
2. Fork the [Particle Theme](https://github.com/nrandecker/particle/fork)
3. Clone the repo you just forked.
4. Edit `_config.yml` to personalize your site.

## Site and User Settings

You have to fill some informations on `_config.yml` to customize your site.

```
# Site settings
description: A blog about lorem ipsum dolor sit amet
baseurl: "" # the subpath of your site, e.g. /blog/
url: "http://localhost:3000" # the base hostname & protocol for your site

# User settings
username: Lorem Ipsum
user_description: Anon Developer at Lorem Ipsum Dolor
user_title: Anon Developer
email: anon@anon.com
twitter_username: lorem_ipsum
github_username:  lorem_ipsum
gplus_username:  lorem_ipsum
```

**Don't forget to change your url before you deploy your site!**

## Color and Particle Customization
- Color Customization
  - Edit the sass variables
- Particle Customization
  - Edit the json data in particle function in app.js
  - Refer to [Particle.js](https://github.com/VincentGarreau/particles.js/) for help

## Running the blog in local

In order to compile the assets and run Jekyll on local you need to follow those steps:

- Install [NodeJS](https://nodejs.org/)
- Run `npm install`
- Run `gulp`

## Questions

Having any issues file a [GitHub Issue](https://github.com/nrandecker/particle/issues/new).

## License

This theme is free and open source software, distributed under the The MIT License. So feel free to use this Jekyll theme anyway you want.

## Credits

This theme was partially designed with the inspiration from these fine folks
- [Willian Justen](https://github.com/willianjusten/will-jekyll-template)
- [Vincent Garreau](https://github.com/VincentGarreau/particles.js/)

## 3. 주소록, 게시판 만들기
본 페이지에 올라와있는 파일들을 그대로 붙여넣고, CLASSPATH 설정만 하면 됩니다.
