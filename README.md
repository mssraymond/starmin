# Welcome to Starmin (StarRocks + MinIO)

## Prerequisites

- [Docker](https://docs.docker.com/engine/install/)
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

## Quickstart

1. `./1-deploy`: Deploy necessary resources.
2. `./2-status`: Check to see that everything's running. This could take a minute.
3. `./3-port-forward`: Port-forward so you can access MinIO UI at `localhost:9001`.
4. Create "starrocks" bucket via the UI.
5. Run `kubectl exec --stdin --tty service/kube-starrocks-fe-service -- mysql -P9030 -h127.0.0.1 -u root --prompt="StarRocks > "` and then copy/paste and run all the commands in [queries.sql](scripts/queries.sql).
6. To ingest data, run `./scripts/curls.sh`.
7. Peruse through your tables by querying `crashdata` and `weatherdata`. You can even following along this [analysis exercise](https://docs.starrocks.io/docs/quick_start/helm/#answer-some-questions).
8. `./4-destroy`: Undeploy all resources.
9. `./5-reset`: Remove all extraneous directories and files.

***Enjoy!*** 🤗
