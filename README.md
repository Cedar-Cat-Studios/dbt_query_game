# Query: the Video Game

This dbt project is an open source glimpse into the inner workings of the [Query](tbd) video game. This repo will provide the previous days queries within the [daily_queries](https://github.com/Cedar-Cat-Studios/dbt_query_game/tree/main/models/daily_queries) folder. Additionally, other queries used in the background of the game can be found and explored within the [background_queries](https://github.com/Cedar-Cat-Studios/dbt_query_game/tree/main/models/background_queries) folder. In addition to providing more insight into the Query game, this project is designed for the community to engage with the developer and contribute to the games codebase.

## 🎮 Play the Game

Query is available to play on both MacOS and Windows. You can download the and play using either the [Apple App Store]() or [Google Play]() links. Be sure to come back each day to test your sql strength!

## 😻 Contribute to the Game
The Query game was developed for the community of to allow players to strengthen, build, and develop their sql skills while having fun. As the game was designed with the community in mind, this repo is intended to be used for the community to contribute their own queries to have a chance to be featured as a daily query in the game! Sound like fun? Here is how you can contribute:

### Step 1: Seed the Schema
This project contains all the relevant seed data (shout out to the OG Jaffle Shop dataset) used within the Query game. You can install this dbt project and seed the data into your respective warehouse. Once you have the project installed you may simply seed the data with the following command:
```zsh
dbt seed -s +dbt_query_game
```

### Step 2: Explore the Data
Now that the data used for the Query game is in your warehouse, you can explore as much as you like. I challenge you to come up with a question (ideally that a friendly neighborhood stakeholder would ask) and answer the question with a query.

### Step 3: Submit Your Query
Once you have a question and query, you can fork this repo and add your querstion/query to the [daily_queries](/daily_queries) folder as a `.sql` file with the naming convention of `<github username>_<date>.sql`. Additionally, the contents of your `.sql` file should follow the format outlined below:

```sql
-- What is our best all time selling item?
select 
    name,
    count(id) as total_units
from {{ source('query_game','order_lines') }}
group by 1
order by total_units desc
limit 1
```

> **Note:** Specifically, you will want to include the question as a comment at the top, and the query below which answers the question.

### Step 4: Submit a PR
With your `.sql` file added to your fork, you can open the PR against this repo! Be sure to follow the prompts when completing the PR and continue playing to see if your query is featured in the game! If your query is featured, your PR will be lightly edited and merged into this repo.

## 💝 Support the Dev
[@JoeMark17](https://github.com/JoeMark17) is the sole developer of the Query game. All queries run within the Query game are executed and billed against a BigQuery project maintained by the individual developer. If you would like to support the developers efforts to keep the Query game (and the BigQuery project) funded, then you can sponsor this repo or contribute via [PayPal](tbd). Any and all support is greatly appreciated!

## 🎉 Help Improve the Game
Query is continually maintained and iterated upon by the developer. If you would like to suggest new features or raise bugs, you can do so within this repository.
