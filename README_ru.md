# PageContainer
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

_PageContainer_ реализует простой способ вывода на экран AlertView, ActionSheetView и т.п.<br />
Контейнер страницы располагается на самом верхнем уровне view. Не нужно создавать state-переменные и прочее. Показ осуществляется через вызов методов ViewModel. Это удобно когда у вас в приложении много экранов, а также, когда нужно чтобы view выглядели нестандартно.<br />
Выводимые view можно модифицировать при помощи _PageContainerConfig_ (singleton). Изменять можно цвет фона, цвет текста, кнопок, рамок, радиус скругления и прочее.<br />

LoadingView блокирует экран и отображает информацию, в центре экрана, о то что происходит загрузка.<br />
AlertView выводит в центре экрана информацию: иконку, заголовок, текст и кнопку OK.<br />
ActionSheetView выводит в центре экрана: заголовок, тело (другое view, опционально) и массив кнопок.<br />
BottomButtonsView выводит внизу экрана: заголовок (опционально) и массив кнопок.<br />


## Требования
* iOS 14.0+


## Установка

**Swift Package Manager**

В Xcode:<br />
* File - Swift Packages - Add Package Dependency...
* Ссылка на репозиторий https://github.com/sboko83/PageContainer

**Ручная установка**

Проект не имеет внешних зависимостей.<br />
Если необходимо добавить PageContainer к другому проекту, то нужно скопировать папку _PageContainer_ в ваш проект с опциями "Copy items is needed" и "Create groups".<br />


## Примеры использования

**Основные действия**
Перед использованием необходимо импортировать модуль.<br />
Нужно создать ViewModel и наследовать ее от _PageContainerViewModel_.<br />
В корневом View, которое отвечает за весь экран добавляем ViewModel и вызов _PageContainer_.<br />
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
import PageContainer

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
import PageContainer

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
import PageContainer

class TestViewModel: PageContainerViewModel {
    func outputUserInfo() {
        // возможные действия и/или условия
        showMessage(message: "User information") {
            // действия после закрытия AlertView
        }
    }
}
```
```Swift
import PageContainer

struct TestPageView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        PageContainer(viewModel) {
            Button(action: { viewModel.outputUserInfo() }) {
                Text("Show user info")
            }
        }
    }
}
```

Все примеры использования есть тут: [Demo проект](https://github.com/sboko83/PageContainer/tree/main/Demo)


## Изменения

**0.4.2**
- Формирование ActionSheetView полностью вынесено из модели в основное View.
Изменения в Demo-проекте: 
- Изменения структуры проекта.
- Переработан показ ActionSheetView и BottomButtonsView.
- PageContainer теперь не как зависимость SPM, а ссылка на папку.

**0.4.1**
- PageContainerConfig рефакторинг.
- Добавлен метод setLightStyle в PageContainerConfig.
- Некоторые изменения в демо-проекте.

**0.4**
- Добавлена возможность показа CustomView.
- Рефакторинг.
- Правка документации на русском и английском языках.
- Добавлен demo-проект.

**0.3**
- У AlertView переработана иконка, теперь ее можно задать самому.
