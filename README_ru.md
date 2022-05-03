# PageContainer
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

_PageContainer_ реализует простой способ вывода на экран AlertView, ActionSheetView и т.п.
Контейнер страницы располагается на самом верхнем уровне view. Не нужно создавать state-переменные и прочее. Показ осуществляется через вызов методов ViewModel. Это удобно когда у вас в приложении много экранов, а также, когда нужно чтобы view выглядели нестандартно.
Выводимые view можно модифицировать при помощи _PageContainerConfig_ (singleton). Изменять можно цвет фона, цвет текста, кнопок, рамок, радиус скругления и прочее.

LoadingView блокирует экран и отображает информацию, в центре экрана, о то что происходит загрузка.
AlertView выводит в центре экрана информацию: иконку, заголовок, текст и кнопку OK.
ActionSheetView выводит в центре экрана: заголовок, тело (другое view, опционально) и массив кнопок.
BottomButtonsView выводит внизу экрана: заголовок (опционально) и массив кнопок.


## Требования
* iOS 14.0+


## Установка

**Swift Package Manager**

В Xcode:
File - Swift Packages - Add Package Dependency...
Ссылка на репозиторий (https://github.com/sboko83/PageContainer)

**Ручная установка**

Проект не имеет внешних зависимостей.
Если необходимо добавить PageContainer к другому проекту, то нужно скопировать папку _PageContainer_ в ваш проект с опциями "Copy items is needed" и "Create groups".


## Примеры использования

**Основные действия**
Перед использованием необходимо импортировать модуль.
Нужно создать ViewModel и наследовать ее от _PageContainerViewModel_.
В корневом View, которое отвечает за весь экран добавляем ViewModel и вызов _PageContainer_.
```Swift
import PageContainer

class TestViewModel: PageContainerViewModel {
} 
```
```Swift
import PageContainer

struct TestPageView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        PageContainer(viewModel) {
            // <- Тут ваша view (контент)
        }
    }
}
```

**Пример вывода LoadingView**
```Swift
class TestViewModel: PageContainerViewModel {
    func loadSomeData() {
        showLoading() // показываем LoadingView
        networking.request { result in
            // обработка данных тут
            self.hideLoading() // скрываем LoadingView
        }
    }
}
```
```Swift
struct TestPageView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        PageContainer(viewModel) {
            Button(action: { viewModel.loadSomeData() }) {
                Text("Load data")
            }
        }
    }
}
```

**Пример вывода AlertView**
```Swift
class TestViewModel: PageContainerViewModel {
    func outputUserInfo() {
        // возможные действия и/или условия
        showMessage(message: "User information") {
            // действия после закрытия AlertView
        }
    }
}
```

Все примеры использования есть тут: (https://github.com/sboko83/PageContainer/tree/main/Demo)


## Изменения

**0.4**
- Добавлена возможность показа CustomView.
- Рефакторинг.
- Правка документации на русском и английском языках.
- Добавлен demo-проект.

**0.3**
- У AlertView переработана иконка, теперь ее можно задать самому.
