# Citiezz In Motion
A SwiftUI-based iOS demo application showcasing Clean Architecture principles with MVVM.

-----
## Key features
- **City List:** Displays a dynamic list of cities fetched from a remote endpoint.
- **Search Bar:** Includes an intuitive search bar to filter cities in real time.
- **Responsive UI:** Detects device orientation (portrait or landscape) and adapts the interface accordingly.
- **No External Dependencies:** Built without external libraries, ensuring full control over the code and project stability.

-----
## Architecture overview
![Diagram](https://github.com/araujocarlosm/CitiezzInMotion/blob/main/CitiezzInMotion.drawio.png)

### Presentation Layer
Responsible for managing the user interface and interacting with the Domain Layer to display data and handle user inputs. It follows the MVVM to ensure a clean separation of concerns.

**Performance optimization**
A key aspect of the development was the use of LazyVStack to optimize the loading and rendering of over 200,000 city entries in the list. By leveraging LazyVStack, the app efficiently loads only the visible elements and those close to them, significantly reducing memory consumption. This approach ensures a smoother user experience, even when handling large datasets.

**Enhanced search**
To improve the accuracy of the search bar, special characters were formatted. This decision was made with the goal of increasing the number of possible matches when searching, ensuring that users can find relevant results even if there are variations in the use of special characters, such as accents, symbols, or punctuation.

-----
### Domain Layer
The Domain Layer is the core of the application's business logic. It defines the essential rules and operations, ensuring the app behaves consistently regardless of the data source or UI.
**1) Entities:**
- **CityEntity** represents a city with its core attributes used throughout the app.
- **Coordinates** represents the geographical location of a city, encapsulating latitude and longitude.

**2) Use Cases:**
- ``FetchCitiesUseCaseProtocol`` fetches a list of cities from the repository.
- ``SortCitiesUseCaseProtocol`` sorts the list of cities based on user-defined criteria.
- ``FilterCitiesUseCaseProtocol`` filters the list of cities based on the search query.

**3) Repository Interfaces:**
- ``RemoteRepositoryProtocol`` handles data fetching from remote sources.
- ``LocalRepositoryProtocol`` manages local data storage operations.

-----
### Data Layer
The Data Layer is responsible for managing the application's data flow between the Domain Layer and external data sources. It is divided into two main components.
**1) DataSource:** 
- Defines the ``CitiesDataSourceProtocol``, which abstracts the details of data retrieval and storage.
- The ``CitiesDataSource`` interacts with **ApiService**, to fetch city-related data.

**Repositories:**
- Implements the ``RemoteRepositoryProtocol`` and ``LocalRepositoryProtocol`` to act as a bridge between the Domain Layer and the data sources.
