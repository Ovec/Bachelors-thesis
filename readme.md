
# Bachelor’s thesis

Databases are an integral part of most systems and play a significant role in our lives. One of the most widely used database systems is Postgres, which was founded in the 1980s and continues to be the industry leader, employed in a wide range of applications. However, with the emergence of Kubernetes and the extensive migration of software systems to this orchestrator, the need to transition to Kubernetes for Postgres has arisen.

While Kubernetes is a versatile platform originally designed for deploying stateless microservice applications, it alone cannot fulfill all the requirements for achieving the high availability demanded on Postgres. To address this, CoreOS introduced the operator pattern, enabling the management of complex stateful applications that require synchronization between their nodes. An operator is a specialized software that extends the Kubernetes API and possesses specific knowledge of managing resources that Kubernetes lacks.

By utilizing the operator pattern, it becomes possible to achieve various functionalities for Postgres, such as high availability, backup to different cloud storage, Point-In-Time recovery, vertical or horizontal scaling, and upgrading to a new version of Postgres without human operator intervention. This eliminates the need for tedious and repetitive manual work, which is replaced by the Kubernetes Operator.

The focus of this thesis is to identify the appropriate Postgres lifecycle operators, establish metrics for creating a testing methodology, conduct tests, evaluate the results, and provide clear and comprehensive recommendations on selecting operators that align best with the defined metrics.

## Authors

- [@ovec](https://www.github.com/ovec)

