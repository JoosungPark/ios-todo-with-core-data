# ios-todo-with-core-data

CoreData와 함께 Todo 어플리케이션을 만듭니다.

Todo는 아래와 같이 구성됩니다.

title 
description
createdAt  // 생성일시
updatedAt  // 수정일시
dueDate   // 마감기한 일시
closedAt  // 완료 일시
status : open, close, delete

어플리케이션은 Todo에 대한 CRUD를 지원합니다.
저장된 Todo를 볼 수 있는 옵션은 상태별이며
sorting은 createAt, updatedAt, dueDate, closeAt을 지원합니다.

CoreData 활용을 목표로 한 샘플 앱이므로, Todo는 다른 Todo를 enroll할 수 있어야합니다.
즉, 재귀적으로 Todo가 포함될 수 있고
parent Todo의 status는 다음의 우선순위에 따라 child todo 모든 status가 만족할 때 변경됩니다.
open > close > delete

해당 샘플은 RxSwift+CoreData로 구성할 예정입니다.
