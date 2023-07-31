# ios-keynote
3-4주차 프로젝트



# 프로젝트 데이터 흐름 및 구조

<img width="688" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/afc5749d-a5a1-4848-a3ae-daf5468ddbd1">




# **아이패드 앱 프로젝트 (월요일)**

1. **iOS 앱 프로젝트 생성 (20분)**: "MyKeynote"라는 이름의 아이패드용 iOS 앱 프로젝트 생성, 테스트 옵션을 포함,  iPad 전용 앱으로 설정 ✅
2. 전반적인 요구사항 분석 (1시간) ✅ 
3. 이번주 계획 세우기 (1시간) ✅
4. **모델 클래스(class) 설계 (1시간 30분)**: 정사각형 슬라이드 뷰를 표현하는 모델 클래스를 설계 ✅
5. CustomStringConvertible 학습 _ swift는 toString()을 쓰지 않는다 ( 30분 ) ✅
6. CustomStringConvertible 프로토콜을 추가하고 구현 ( 30분 ) ✅
7. 팩토리 패턴 문서 찾아보기( 30분 ) ✅
8. 팩토리 패턴 예제 찾아보기( 30분 ) ✅
9. **팩토리 구현 (30분)**: 모델 클래스의 랜덤값을 처리하는 팩토리 구현 ✅
10. **모델과 ViewController의 연결 (소요시간: 30분)**: 팩토리에서 생성한 Square-Slide 인스턴스를 ViewController와 연결하고, 로그 함수로 출력합니다. ✅
11. **테스트 및 검증 (30분)** ✅

## [3-1] 결과 
** 완료 시점 : 화요일 오후 11시 **
![image](https://github.com/eigen98/eigen98/assets/68258365/de395070-e011-401a-83aa-dc171f12d863)
### 🤖 title
[고정민] - (3-1) 아이패드 앱 프로젝트

### 💭what 
- [x] 주간 계획 Readme 작성 
- [x] 슬라이드 모델을 프로토콜 지향적으로 설계
- [x] 제너레이터를 만들어서 넣어줌으로써 테스트가 가능하도록 IDGenerator 구현
- [x] 슬라이드 생성 및 시스템 로그를 통한 출력 구현

### 💭고민한 부분 및 느낀점
- [x] 프로토콜을 적극적으로 사용해보려고 고민하였습니다.
마스터 세션을 듣기전에는 Slide Protocol - Slide 구현체에서 생각이 멈추는 듯한 느낌을 받았습니다.  명사를 정해두면 생각이 갇히며 메시지에 집중해보는 것이 좋다는 말씀을 듣고나서 적극적으로 추상화해볼 수 있는 용기가 생겼습니다.
- [x] 메시지를 먼저 쓰고 메시지를 처리하기 적합한 객체를 반대로 생각해보려고 노력해보았습니다. 
    a. 슬라이드의 컴포넌트 추가, 제거 등의 관리에 필요한 메시지 -> SlideContentManageable protocol
    b. 슬라이드를 표시하라는 메시지 -> SlideDisplayable protocol
    c. 슬라이드를 생성하라는 메시지 -> SlideFactoryProtocol
    d. 애니메이션 적용 메시지 -> AnimationApplicable protocol
- [x] 고유 아이디 생성시 충돌을 관리하기 위해 Set사용.
    a. 생성된 모든 ID를 Set에 저장하고 충돌시 ID를 재생성하도록 구현하였습니다.  ID가 나올 수 있는 경우의 수는 (62^3)^3 으로 충돌 가능성은 낮다고 보여집니다.
- [x] 테스트하려는 경우 예측 가능한 난수를 생성하는 커스텀 RandomGenerator를 사용할 수 있도록 구현하였습니다.
- [x] 시스템 로그 os_log를 통한 출력

## 학습 키워드
- RandomNumberGenerator
- CustomStringConvertible
- Protocol
- POP
- Logger
- OSLog
- static func와 class func 차이
- 저장 프로퍼티와 연산프로퍼티


# **속성 변경 동작**

1. PR 리뷰 반영 리팩토링 및 정리( 2시간 ~ 3시간 )✅
2. **Struct와 Class 차이점 학습 (30분)**✅
3. **SlideManager 구조체 설계 (1시간)**: SlideManager 구조체를 설계하는 데 필요한 기능과 요구사항 정리✅
4. **SlideManager 구조체 기본 기능 구현 (1시간)**:  ✅
    1. 슬라이드 생성 및 추가,✅
    2.  슬라이드 개수 확인✅
    3. 인덱스를 통한 슬라이드 반환✅
5. **SlideManager 구조체 추가 기능 구현 (1시간)**: SlideManager에서 처리해야 하는 추가적인 역할에 대해 구현합니다. 예를 들어, 속성이 변경될 때 화면을 다시 그리는 로직 등을 구현할 수 있습니다.✅
6. **SlideManager 유닛 테스트 학습 (30분) : UnitTest 개념 복습**✅
7. **SlideManager 유닛 테스트 작성 (1시간)**: 학습한 내용을 바탕으로 SlideManager의 기능을 테스트하는 유닛 테스트를 작성✅
8. **터치 이벤트 학습 (30분)**: iOS에서 터치 이벤트를 처리하는 방법에 대해 학습.✅
9. **터치 이벤트 로직 설계 (30분)**: 터치 이벤트를 어떻게 처리할지에 대한 로직을 설계.✅
10. **터치 이벤트 구현 (1시간)**✅
11. **뷰 속성 변경에 따른 업데이트 학습 (30분)**: 뷰의 속성이 변경될 때 화면을 다시 그리는 방법을 학습합니다.✅
12. **뷰 속성 변경에 따른 업데이트 구현 (1시간)**: 배경색과 투명도 등의 속성 변경 시 화면을 다시 그리는 로직을 구현합니다.✅
13. **[README.md](http://readme.md/) 파일 작성 (1시간)**✅
## [3-2] 결과
** 완료 시점 : 수요일 오후 6시 **
### 🤖 title
[고정민] - (3-2) 속성 변경 동작

### 💭what 
- [x] 뷰컨트롤러와 SlideManager 모델, 그리고 Keynote의 전체 뷰를 담당하는 KeynoteView로 분리하였습니다.
- [x] 좌측 SlideListView, PresentationView, 우측 InspectorView , StpperView 컴포넌트 화
- [x] 슬라이드 컴포넌트 팩토리 추가.
슬라이드와 다르게 컴포넌트의 종류는 더 다양할 것이라고 생각하여 제네릭과 MetaType을 이용한 메소드를 통해 생성하도록 하였습니다
- [x] 키노트의 슬라이드와 슬라이드의 컴포넌트를 구분하고 각 객체에 필요한 기능을 다시 정리하여 프로토콜로 정의하였습니다.
- [x] 컴포넌트 선택, 배경선택시 해제, 배경색상 설정, 투명도 설정 기능 구현 완료하였습니다.
- [x] 의존성 주입이 이루어지는 CompositionRoot를 추가하였습니다.
SlideManager에게 필요한 의존성은 생성자를 통해 주입받을 수 있도록 수정하였습니다. 
- [x] SlideManager 테스트 코드 작성

<img width="315" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/c28e34ce-f962-41ee-86e9-c3d39e1d609c">

### 💭고민한 부분 및 느낀점
- [x] 뷰를 optional로 선언하여 리터럴한 선언을 최소화하였습니다.
적용하면서 뷰의 초기화와 설정을 분리할 수 있기 때문에 더 유연하게 관리할 수 있다는 것을 느꼈습니다.
하지만 오토레이아웃을 사용하게 되면 체이닝된 뷰들의 초기화 순서에 주의해야할 것 같습니다.
- [x] Manager 타입을 struct로 했더니 뷰와 Manager를 딜리게이트로 연결할 수 없었음.
원본 Manager를 변경하더라도 딜리게이트로 설정된 복사본에 반영되지않아 정상적으로 작동하지 않는다는 것을 확인하였습니다.
- [x] UIStepper는 다른 뷰와같이 크기조절을 할 수 없습니다. transform()을 사용하는 방법 등이 있지만 만약 디자이너와 협업을 하는 상황이라면  쉽지 않을 것 같아서 직접 뷰를 만들기로 하였습니다.
- [x] 처음엔 슬라이드 컴포넌트의 모든 기능과 프로퍼티를 프로토콜로 정의하려고 하였습니다. 
하지만 팩토리에서 생성 메소드를 제네릭과 메타타입을 통하여 컴포넌트를 생성하려는 경우 프로토콜만으로는 어려워서 BaseElement class를 사용하였습니다. 
여기서 한 가지 더 의문이 드는 것은 id를 Private으로 설정하기 위해 프로토콜이 아닌 BaseElement 클래스에서만 정의하는 경우 컴포넌트를 사용하는 객체에서는 추상타입인 SlideProtorocol이 아닌 BaseElement에 의존하게 됩니다. 이건 구체타입에 의존하게 되는 것이 아닌지 궁금합니다. 
클래스라고 해도 모든 컴포넌트들의 공통 기능을 추상화한것이라면 괜찮은걸까요?

### 학습 키워드
- Protocol
- POP
- struct와 딜리게이트 패턴
- Mocking
- Dependency Injection
- Composition Root
- mutating
- Generic, Metatype
- setUpWithError과 setUp 차이

### 🎁 결과 시연
![3-2결과](https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/45f1d25f-405d-4314-a2a6-3cb21911b193)


# **관찰자(Observer) 패턴**

1. PR 리뷰 반영 리팩토링 및 정리( 2시간 ~ 3시간 )✅
2. **NotificationCenter 및 Observer 패턴 학습 (2시간)**✅
    - NotificationCenter의 개념과 기본적인 사용법 학습 (20분)✅
    - 강의 자료 시청( 1시간 )✅
    - Observer 패턴의 개념과 기본적인 사용법 학습 (20분)✅
    - Observer 패턴을 사용하여 Model과 Controller 간의 참조 관계를 끊는 방법 학습 (20분)✅
3. **MVC 패턴 및 느슨한 연결(loose coupling)에 대한 이해 (30분)**✅
    - MVC 패턴의 개념과 구조 학습 (10분)✅
    - 느슨한 연결(loose coupling)의 개념과 이점 학습 (10분)✅
    - 느슨한 연결을 활용한 MVC 패턴 구현 방법 학습 (10분)✅
4. **NotificationCenter 동작 방식 학습 (1시간)**✅
    - NotificationCenter를 사용한 Observer 패턴 구현 방법 학습 (30분)✅
    - NotificationCenter를 활용한 실습 진행 (30분)✅
5. **Observer 패턴 적용 및 화면 갱신 로직 설계 (1시간)**✅
    - Observer 패턴을 프로젝트에 적용하는 방법 계획 (20분)✅
    - 재고가 추가될 때마다 화면을 갱신하는 로직 설계 (40분)✅
6. **화면 갱신 로직 구현 (2시간)**✅
    - 설계한 로직에 따라 Observer 패턴 적용 및 화면 갱신 로직 구현 (1시간)✅
    - 배경색 또는 투명도 속성이 변경될 때마다 화면 업데이트하는 기능 구현 (1시간)✅
7. **[README.md](http://readme.md/) 파일 작성 (30분)**✅

## [3-3] 결과
** 완료 시점 : 목요일 오후 3시 **
### 🤖 title
[고정민] - (3-3) 관찰자(Observer) 패턴

### 💭what 
- [x] 뷰컨트롤러에서 Notification observer 등록(색상 변경, 투명도 변경, 선택된 컴포넌트)하였습니다.
- [x] Notification를 받아서 SlideManager가 모델을 업데이트하도록 구현하였습니다. 
- [x] InspectorView 색상 변경, 투명도 변경 이벤트 발생 Notification 추가하였습니다.
- [x] NotificationName을 String값을 입력하며 발생하는 실수를 줄이고자 열거형으로 정의하였습니다.
<img width="495" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/c98f53b8-5eed-4768-a38b-11b0964ff0bf">

### 💭PR 반영한 부분
- [x] Composition Root 수정
호출 시 인스턴스를 새롭게 생성하던 기존의 방식이 아닌 한번 생성된 인스턴스를 재사용하는 싱글톤 패턴으로 수정하였습니다.

- [x] 뷰와 모델 분리
BaseComponentView 뷰로부터 element(모델)를 속성으로 가지고 있는 코드를 제거하였습니다.

- [x] BaseElement 공통적인 속성을 제외한 속성 제거
Animation과 같은 바로 쓰이지 않는 속성은 선언되지않도록 하였습니다. 처음 설계할 때 Element를 가장 상위의 protocol로 생각하지 않고 반대로 Selectable, Resizable과 같은 프로토콜이 더 추상화된 프로토콜이라고 생각하고 구현하였었습니다. 이것이 원인이 되어 현재 BaseElement가 처음부터 많은 공통기능을 가지게 되어버린 것 같습니다. 시간이 부족할 것 같아서 이부분은 다음 과제를 진행하면서 수정해보려고 합니다.

<img width="762" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/ab37dff4-0933-4551-8ccc-5073980de5f7">

- [x] 불필요한 코드 제거
a. KeynoteViewController의 slideManager 속성이 두번 초기화 되는 코드 수정.
b. 이미 backgroundColor 접근이 가능한데도 추가된 color 속성 제거

- [x] CustomStepper 수정 시도
UIVIew로 커스텀하는 것이 아닌 UIStepper를 상속받아서 IntrinsicContentSize를 변경하여 크기와 디자인을 커스텀하려고 하였으나 반응이 없었고 방법을 찾지 못하여 실패하였습니다.

### 학습 키워드
- UIStepper
- IntrinsicContentSize
- NotificationCenter
- Publisher/Observer Pattern
- Dependency Injection
- Composition Root


### 🎁 결과 시연
![3-2결과](https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/45f1d25f-405d-4314-a2a6-3cb21911b193)


# **슬라이드 목록 표시**

1. PR 리뷰 반영 리팩토링 및 정리( 2시간 ~ 3시간 )✅
2. **UITableView 학습 (2시간)**✅
    - 강의 자료 시청 및 정리(1시간)✅
    - UITableView의 개념과 사용법 학습 (20분)✅
    - UITableView를 사용하여 기본적인 목록 뷰 생성 실습 (20분)✅
    - 커스텀 셀에 대한 이해와 구현 방법 학습 (20분)✅
3. **UITableViewDataSource 프로토콜 학습 (1시간)**✅
    - UITableViewDataSource 프로토콜의 개념과 필요한 메소드 학습 (20분)✅
    - UITableViewDataSource 프로토콜을 채택하여 데이터를 테이블 뷰에 연결하는 방법 학습 (20분)✅
    - 각 셀에 데이터를 할당하는 방법 학습 (20분)✅
4. **UITableViewDelegate 프로토콜 학습 (1시간)**✅
    - UITableViewDelegate 프로토콜의 개념과 필요한 메소드 학습 (20분)✅
    - 셀 선택 시 동작을 처리하는 방법 학습 (20분)✅
    - UITableViewDelegate를 이용한 테이블 뷰 커스터마이징 학습 (20분)✅
5. **슬라이드 목록 표시 기능 구현 (2시간)**✅
    - UITableView를 이용하여 슬라이드 목록 표시 기능 설계 (30분)✅
    - UITableViewDataSource 프로토콜을 채택하여 슬라이드 데이터 연결 (30분)✅
    - UITableViewDelegate 프로토콜을 이용하여 셀 선택 시 슬라이드 표시 기능 구현 (30분)✅
    - (+) 버튼을 추가하여 정사각형 슬라이드 추가 기능 구현 (30분)✅
6. **[README.md](http://readme.md/) 파일 작성 (30분)**✅

## [3-4] 결과
** 완료 시점 : 목요일 오후 7시 **
### 🤖 title
[고정민] - (3-4) 슬라이드 목록 표시

### 💭what 
- [x] 좌측 슬라이드 리스트 테이블뷰 커스텀 셀을 구현하였습니다.(SlideListTableViewCell)
- [x] SlideListView의 테이블뷰 관련 딜리게이트, 데이터소스를 구현하였습니다.
    - UIViewController(delegate, datasource 구현) -> KeynoteView -> SlideListView의 UITableView
- [x] 슬라이드 순서 변경을 위한 UITableViewDragDelegate, UITableViewDropDelegate의 메소드를 구현하였습니다.
- [x] 슬라이드 셀 클릭 이벤트를 구현하였습니다.
    - 다른 셀 클릭시 PresentationView 리셋 -> 선택한 슬라이드의 컴포넌트 보여주기
    - 해당 슬라이드 셀 클릭 해제 & 선택 가능.


### 학습 키워드
- UITableViewDropDelegate
- UITableViewDragDelegate


### 🎁 결과 시연

| 투명도 & 색상 변경  기능| ![투명도_색상변경](https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/a9d5bfa0-306c-4445-b907-dedcc157e7e1) |
|:---:|:---:|
| 슬라이드 순서변경 기능 | ![슬라이드순서변경](https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/947ef14e-6e8d-4674-9763-316a6da67dc5) |
| 슬라이드추가 및 선택 기능 | ![슬라이드추가및선택](https://github.com/softeerbootcamp-2nd/ios-keynote/assets/68258365/f71b4844-6b48-4093-9ad5-cfc337c68ecc) |






# **사진 슬라이드 추가하기**

1. PR 리뷰 반영 리팩토링 및 정리( 2시간 ~ 3시간 )
2. **UIImageView 학습 (1시간)**
    - UIImageView의 개념과 사용법 학습 (20분)
    - 사진을 UIImageView에 로드하고 표시하는 방법 학습 (20분)
    - UIImageView에 대한 여백과 원본 비율 유지에 대한 학습 (20분)
3. **PhotoPicker 학습 (1시간)**
    - PhotoPicker의 개념과 사용법 학습 (20분)
    - 사용자의 사진 앨범에 접근하고 사진 선택 기능 구현 (20분)
    - 선택한 사진의 URL 가져오는 방법 학습 (20분)
4. **사진 추가 기능 구현 (2시간)**
    - 슬라이드에 사진 추가하는 기능 설계 (30분)
    - PhotoPicker를 사용하여 사진 선택 후 UIImageView에 로드하는 기능 구현 (30분)
    - 사진을 추가하기 위해 뷰 속성을 구성하는 모델 설계 및 구현 (60분)
5. **슬라이드 목록 메뉴 기능 구현 (2시간)**
    - 길게 터치 시 메뉴 띄우는 기능 설계 및 구현 (1시간)
    - 각 메뉴 선택 시 슬라이드 순서 조정하는 기능 구현 (1시간)
6. **README.md 파일 작성 (30분)**
