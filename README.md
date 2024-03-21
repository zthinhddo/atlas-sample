# [Atlas](https://atlasgo.io/) - Database Migration Platform

## I. Setup / Installation
*|Test Migration Atlas Cloud*
- [Atlas Cloud](https://test-migration.atlasgo.cloud/getting-started)

*|Environments setup options*
- *Linux:* `curl -sSf https://atlasgo.sh | sh`
- *Windows:* ``

## 1.1 Use Cases
- [ ] Inspecting and visualing database schema
- [ ] Setup Automatic Migration
- [ ] CI for Schema changes
- [ ] Deploy a simple project to production
- [ ] Dashboard Utility: Diagnose and Report Schema changes

## 1.2 TODOs
- [x] [Automatic Migration for PostgreSQL with Atlas](https://atlasgo.io/guides/postgres/automatic-migrations)
- [ ] [Automatic Migration with TypeORM](https://atlasgo.io/guides/orms/typeorm)
- [ ] [Intergration tests with Github Actions](https://atlasgo.io/guides/testing/github-actions)

## II. Atlas Cloud Guides
### Step 1. Login Atlas Cloud
```sh
atlas login
```
![Succesfull Atlas login message](image.jpg)

### Step 2. Access Atlas sample: [click here](https://github.com/zthinhddo/atlas-sample)
### Step 3. Push project to Atlas cloud
```sh
sudo atlas migrate push app --dev-url "docker://postgres/15/[db_name]?search_path=[schema_name]"
```
- If for some reasons, you need to delete files in **migrations** folder, after deleting the file remember to do hashing again
```sh
atlas migrate hash
```
### Step 4. Open URL (provided in the terminal) for entering Atlas Cloud Dashboard 
- Dashboard for this sample: [test-migration dashboard](https://test-migration.atlasgo.cloud/getting-started)

### Step 5: Analyzing the migration
- Run by command
```sh
sudo atlas migrate lint --env local --latest 1
```
- Interact with UI
![]()


## III. Local Atlas Guides
### Step 1. Create PostgreSQL database container
```sh
docker run --rm -d --name postgres-atlas-demo -p 5432:5432 -e POSTGRES_PASSWORD=1234 -e POSTGRES_USER=postgres -e POSTGRES_DB=example postgres
```

### Step 2. Inspecting new created database (e.g. example)
- SQL version
```sh
atlas schema inspect -u "postgres://postgres:1234@localhost:5432/example?sslmode=disable" --format '{{ sql . }}' > schema.sql
```
- HCL version
```sh
atlas schema inspect -u "postgres://postgres:1234@localhost:5432/example?sslmode=disable" > schema.hcl
```

### Step 3. Comparing schema (this one compare local schemas/database to remote schemas/databases)
```sh
atlas schema diff \
  --from "postgres://postgres:1234@localhost:5432/example?sslmode=disable" \
  --to "file://schema.sql" \
  --dev-url "docker://postgres/15/example" \
  --format '{{ sql . }}' \
  --exclude 'atlas_schema_revisions'
```

### Step 3.1 (Optional) Hash migrations - fix differences between schemas sources
```sh
atlas migrate hash
```

### Step 4. Generating migrations
```sh
sudo atlas migrate diff initial --to file://schema.sql --dev-url "docker://postgres/15/example?search_path=public" --format '{{ sql . " " }}'

```

### Step 5. Applying new schema (migration)
```sh
atlas schema apply \
  --url "postgres://postgres:1234@localhost:5432/example?sslmode=disable" \
  --to "file://migrations" \
  --dev-url "docker://postgres/15/example" \
  --exclude 'atlas_schema_revisions'
```

### Step 6. Refer **Atlas Cloud Guides** to push migrations to Atlas Cloud Registry

## Notes
- [Explore Atlas Playground](https://gh.atlasgo.cloud/explore)


## References
- [Analyzer + Linting](https://atlasgo.io/lint/analyzers)
- [Troubleshooting](https://atlasgo.io/blog/2023/04/10/troubleshooting-migrations)
- [Atlat URLs](https://atlasgo.io/concepts/url)
- [Setup docker container](https://atlasgo.io/guides/deploying/image)
