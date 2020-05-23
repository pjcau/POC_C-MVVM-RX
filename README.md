# POC_C-MVVM-RX
Use MVVM with Coordinator and all reactive programming with RXSwift. The MVVM have some advangaes:

* Collaborative working
* Code reuse
* Ease of testing
* Bindings make UI updates easier to handle
* Ease of maintainability

So I choose the Coordinator pattern so manage the flows, also in this case it's very simple. 
It's allows you to isolate navigation from Business Logic by adding a top layer that manages routing.

While RXSwift is Framework to manage the reactive programming in swift.
I wanted to put together so as to have a total RX app.


## RoadMap
* Write code to Rxswift and Coordinator -> DONE
* Create CitiesListCoordinator to manage the static list  -> DONE
* Create DetailForecastCoordinator to manage the forecast for city  -> DONE
* Added Jazzy, [link docs](https://github.com/pjcau/POC_C-MVVM-RX/blob/master/POC_C-MVVM-RX/docs/index.html) -> DONE
* Add the Unit Test -> TO DO
* Add Fastlane, work locally -> TO DO
* Add the Jenkins Pipeline, Test CI and Fastlane -> TO DO
