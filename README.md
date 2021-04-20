# iOS 커리어 스타터 캠프 - 내손은 금손 앱 저장소

## Jacob의 그라운드 룰

- TIL 작성 습관들이기
- 휴일 에는 쉬거나 이전 작업내용을 다시 돌아보기
- 프로젝트 기능요구서에 충실하기

## 프로젝트 규칙

### 코딩 컨벤션

- Swift API 디자인 가이드라인을 따르려고 노력하기
- 클래스, 함수, 변수 명을 명확하고 객관적인 이름으로 하기
- 가능한 주석 없이 이해가능한 코드 추구하기

### 브랜치

- 스텝별로 브랜치 만들기 (ex: "step1", "step2")
- 스텝의 세부 할일을 이슈로 등록
- 스텝의 세부 할일의 이슈번호로 브랜치 만들고, 완료되면 스텝 브랜치로 머지
  - ex: 1-button
- 스텝완료되면 브랜치를 원본 저장소로 PR 보내고 코드 리뷰 받기

### 커밋 메시지

- 한글로 작성하기 (단, 제목의 Type은 영문으로 작성)
- Title
  - Type과 이슈번호 붙이기
  - 양식: Type: 내용 (#이슈번호)
  - 예시: Feat: 버튼 기능 추가 (#1)
  - Type 리스트
    - Feat: 코드, 새로운 기능 추가
    - Fix: 버그 수정
    - Docs: 문서 수정
    - Test: 테스트 관련
    - Refactor: 코드 리팩토링
    - Chore: 이외 기타 작업
- Description
  - Title은 간단하게 Description은 상세하게
  - Title만으로 설명이 충분하면 Description은 없어도 됨
  - Title에서 한칸 빈칸을 띄우고 작성

### GitHub의 프로젝트 관리기능 적극 활용하기

- 이슈와 프로젝트 기능 활용
  - 작업 시작전에 이슈 등록하고 커밋메세지에 이슈번호 포함
- [github 하나로 1인 개발 워크플로우 완성하기: 이론편](https://www.huskyhoochu.com/issue-based-version-control-101)
- [github 하나로 1인 개발 워크플로우 완성하기: 실전 편](https://www.huskyhoochu.com/issue-based-version-control-201/#open-issue)
- [좋은 git 커밋 메시지를 작성하기 위한 8가지 약속](https://djkeh.github.io/articles/How-to-write-a-git-commit-message-kor/)
