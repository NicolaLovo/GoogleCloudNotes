| Feature                        | **Cloud Run**                           | **Cloud Functions**                          | **App Engine**                               |
| ------------------------------ | --------------------------------------- | -------------------------------------------- | -------------------------------------------- |
| **Use case**                   | Containerized microservices & apps      | Event-driven code or simple functions        | Web apps with full platform abstraction      |
| **Abstraction level**          | Medium (you manage container)           | High (just code)                             | High (just code + config)                    |
| **Runtime**                    | Any (via container)                     | Limited to specific languages                | Flexible (any with Flex) or Standard         |
| **Deployment artifact**        | Docker container                        | Function code                                | App code                                     |
| **Scaling**                    | Automatic (0 → N), per-request          | Automatic (0 → N), per-event                 | Automatic (Standard); Manual possible (Flex) |
| **Startup time (cold starts)** | Fast (\~1s)                             | Very fast (\~200ms)                          | Standard: very fast; Flex: slower            |
| **Concurrency**                | ✅ Yes (default: 80 concurrent requests) | ❌ No (1 request per function instance)       | ✅ Standard: 1; Flex: configurable            |
| **Request types**              | HTTP, gRPC, WebSockets                  | HTTP-triggered, Event-driven (Pub/Sub, etc.) | HTTP or background                           |
| **Custom domains & SSL**       | ✅ Yes                                   | ✅ Yes (through API Gateway or Load Balancer) | ✅ Yes                                        |
| **Authentication**             | IAM, Cloud IAM Auth                     | IAM, Cloud IAM Auth                          | IAM or Firebase Auth                         |
| **Local dev experience**       | Great (Docker supp                      |                                              |                                              |
