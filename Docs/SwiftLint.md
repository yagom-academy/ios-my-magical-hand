# SwiftLint
<br>

## 1. SwiftLint 개념

- Swift Lint == Linter
- `Linter` 란 커뮤니티나 팀에서 정한 스타일 규칙을 따르지 않는 코드 부분을 식별하고 표시하는 것을 돕는다.
- SwiftLint는 스위프트 스타일 및 컨벤션을 강제하기 위한 도구로, [Ray Wenderlich 스위프트 스타일 가이드](https://github.com/raywenderlich/swift-style-guide)에 대략적인 기반을 두고 있다.

<br><br>

## 2. 설치 방법
- homebrew

```swift
 brew install swiftlint
 ```
 ![스크린샷 2021-08-11 오전 11 44 46](https://user-images.githubusercontent.com/65153742/128961558-f8626571-947e-4fbb-be50-757f9df88ae2.png)
 
 <br><br>
 
## 3. 사용 방법
 > Xcode > Bulid Phases > New Run Script Phase  
  
 ![스크린샷 2021-08-11 오전 11 46 19](https://user-images.githubusercontent.com/65153742/128961685-0cb83655-80e8-42d6-81a8-451b6124b78a.png)

<br>

> 코드 추가
- 코드

    ```swift
    if which swiftlint >/dev/null; then
      swiftlint
    else
      echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
    fi
    ```
<br>

> .swiftlint.yml 파일 추가
- 터미널에서 `vi .swiftlint.yml`
- `.swiftline.yml` 설정

    ```swift
    disabled_rules: # 실행에서 제외할 룰 식별자들
      - colon
      - comma
      - control_statement
    opt_in_rules: # 일부 룰은 옵트 인 형태로 제공
      - empty_count
      - missing_docs
      # 사용 가능한 모든 룰은 swiftlint rules 명령으로 확인 가능
    included: # 린트 과정에 포함할 파일 경로. 이 항목이 존재하면 `--path`는 무시됨
      - Source
    excluded: # 린트 과정에서 무시할 파일 경로. `included`보다 우선순위 높음
      - Carthage
      - Pods
      - Source/ExcludedFolder
      - Source/ExcludedFile.swift

    # 설정 가능한 룰은 이 설정 파일에서 커스터마이징 가능
    # 경고나 에러 중 하나를 발생시키는 룰은 위반 수준을 설정 가능
    force_cast: warning # 암시적으로 지정
    force_try:
      severity: warning # 명시적으로 지정
    # 경고 및 에러 둘 다 존재하는 룰의 경우 값을 하나만 지정하면 암시적으로 경고 수준에 설정됨
    line_length: 110
    # 값을 나열해서 암시적으로 양쪽 다 지정할 수 있음
    type_body_length:
      - 300 # 경고
      - 400 # 에러
    # 둘 다 명시적으로 지정할 수도 있음
    file_length:
      warning: 500
      error: 1200
    # 네이밍 룰은 경고/에러에 min_length와 max_length를 각각 설정 가능
    # 제외할 이름을 설정할 수 있음
    type_name:
      min_length: 4 # 경고에만 적용됨
      max_length: # 경고와 에러 둘 다 적용
        warning: 40
        error: 50
      excluded: iPhone # 제외할 문자열 값 사용
    identifier_name:
      min_length: # min_length에서
        error: 4 # 에러만 적용
      excluded: # 제외할 문자열 목록 사용
        - id
        - URL
        - GlobalAPIKey
    reporter: "xcode" # 보고 유형 (xcode, json, csv, codeclimate, checkstyle, junit, html, emoji, sonarqube, markdown, github-actions-logging)
    ```

<br><br>

## 참고링크
- [[야곰닷넷] Swift Lint](https://yagom.net/forums/topic/swift-lint-%EC%8D%A8%EB%B3%B4%EA%B8%B0/)
- [[github] SwiftLint](https://github.com/realm/SwiftLint/blob/master/README_KR.md)
- [[블로그] SwiftLint를 적용해보았습니다. - 여름의 호랑이](https://summerhorang.tistory.com/8)
