# Proof of Technology - dbt Models
This demo project is based on data that comes pre-loaded with all Snowflake trial accounts. It can be used as place to test out ideas, processes, and for practice.

Other important notes:
1. In order to use dbt, a valid Snowflake account is needed.
2. This demo project does not conform to any naming/code standards that may currently be in development.

## Contributing

### dbt Cloud
dbt Cloud is the recommended platform to begin contributing to development work.
In the event dbt Cloud is not available, please read the section "Local Development" section below.
### Local Development
In order to contribute, you will need to configure your local machine as described in the [Dependencies for development](#Dependencies-for-development) section. Once you have the dependencies set up, you can build the `dbt` conda environment which will handle the remaining dependencies.
### Dependencies for development
#### `VScode`
We use [VScode](https://code.visualstudio.com/) as our development IDE. This ensures everyone on our team has a consistent development experience and makes debugging setup issues easier (just copy what works for your teammate!). It is _STRONGLY_ recommended you install the following VScode extensions to improve your development workflow:
- [Advanced new file](https://marketplace.visualstudio.com/items?itemName=patbenatar.advanced-new-file)
- [Better Jinja](https://marketplace.visualstudio.com/items?itemName=samuelcolvin.jinjahtml)
- [dbt Power User](https://marketplace.visualstudio.com/items?itemName=innoverio.vscode-dbt-power-user)
- [Python extension for VScode](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
- [sqlfluff VScode](https://marketplace.visualstudio.com/items?itemName=dorzey.vscode-sqlfluff)
- [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [vscode-dbt](https://marketplace.visualstudio.com/items?itemName=bastienboutonnet.vscode-dbt)
- [Live Share Extension Pack](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare-pack)
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [YAML Validator](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
#### `conda`
We use [Anaconda](https://docs.anaconda.com/anaconda/#anaconda-individual-edition) which includes the `conda` package and environment manager. We use this to setup python virtual environments to ensure everyone is using the same versions of `dbt`.

**Please be sure to install [Python](https://www.python.org/downloads/) and then [Anaconda](https://docs.anaconda.com/) on your machine prior to moving forward with the steps below.**

### Building the `dbt` conda environment
Once you have `conda` installed, navigate inside your local copy of the repo (by cloning it from Github and/or pulling the latest files). Create the conda environment by running the following command from your terminal:
```bash
$ conda env create -f environment.yml
```

Next, activate the `dbt` conda environment by running:
```bash
$ conda activate dbt
```
To deactivate the environment, run:
```bash
$ conda deactivate
```

\* Note dbt commands will not run unless the conda environment is activated.
### Configuring dbt `profiles.yml`
You will need to add a `~/.dbt/profiles.yml` file (home directory) in order for dbt to run models.

It is recommended that each developer use the naming convention of `dbt_{firstName}` for their respective `dev` targets (schemas). For example, John Doe would have schema name of `dbt_john`. Currently, the `account admin` (a more appropriate role will be used in the future) will need to create each person's schema before use if they don't already exist in the `dev` database.

Please read the [documentation](https://docs.getdbt.com/dbt-cli/configure-your-profile) to further understand how the `profiles.yml` configuration works within the dbt system.

Snowflake specific `profiles.yml` documentation can be found [here](https://docs.getdbt.com/reference/warehouse-profiles/snowflake-profile). It also provides a template for use.

Example of a `profiles.yml` file (`~/.dbt/profiles.yml`) for user John Doe (Snowflake user name: jdoe) below:

```
dbt_fundamentals:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: qk45004.west-us-2.azure
      user: jdoe
      password: password # replace with your actual password
      database: dev # replace with your actual database
      role: transformer
      schema: dbt_joe
      threads: 4
      warehouse: transforming
```