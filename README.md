# PageContainer

Page, из названия, это аналогия с web-страницей на сайтах. Контейнер страницы располагается на самом верхнем уровне view и предоставляет вам простой способ вывода на экран AlertView, ActionSheetView, BottomButtonsView и LoadingView через ViewModel.
Не нужно создавать state-переменные и прочее. Показ осуществляется через вызов методов ViewModel. Это крайне удобно, особенно, когда у вас в приложении много экранов.
Выводимые view можно модифицировать при помощи *PageContainerConfig* (singleton). Изменять можно цвет фона, цвет текста, кнопок, рамок, радиус скругления и прочее.

LoadingView блокирует экран и отображает информацию, в центре экрана, о то что происходит загрузка.
AlertView выводит в центре экрана информацию: иконку, заголовок, текст и кнопку OK.
ActionSheetView выводит в центре экрана: заголовок, тело (другое view, опционально) и массив кнопок.
BottomButtonsView выводит внизу экрана: заголовок (опционально) и массив кнопок.

Демо проект есть по адресу: TODO

---

## Установка

**Swift Package Manager**

TODO

**Ручная установка**

Проект не имеет внешних зависимостей.
Если необходимо добавить PageContainer к другому проекту, то нужно скопировать папку *PageContainer* в ваш проект с опциями "Copy items is needed" и "Create groups".

---

## Примеры использования

**Основные действия**
Нужно создать ViewModel и наследовать ее от *PageContainerViewModel*.
В корневом View, которое отвечает за весь экран добавляем ViewModel и вызов *PageContainer*.
```
class TestViewModel: PageContainerViewModel {
} 
```
```
struct TestPageView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        PageContainer(viewModel) {
            // <- Тут ваша view (контент)
        }
    }
}
```
**Пример вывода LoadingView.**
```
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
```
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


---

## Изменения

**0.3**
- У AlertView переработана иконка, теперь ее можно задать самому.
