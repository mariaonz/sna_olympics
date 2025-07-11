# Olympic Network Analysis Project 
📘 Course: DADS7201 Social Network Analysis  
  
The study applies network science techniques to Olympic Games data using Neo4j, exploring athlete-country-sport dynamics through graph analysis.

## 🎯 Obejective:  
To analyze the Olympic Games through the lens of Social Network Analysis (SNA), uncovering hidden patterns, influential athletes and sports, country performance strategies, and inter-nation similarities based on participation and medal achievements. This project leverages centrality measures, weighted scoring, and Jaccard similarity to generate insights that support strategic planning, performance benchmarking, and global sports collaboration.

📌 Data Source: Summer Olympics Medals (1896-2024)   
🔗 https://www.kaggle.com/datasets/stefanydeoliveira/summer-olympics-medals-1896-2024

## 🔍 Key Concepts & Techniques:
- Node Construction:
    - ATHLETES: Individual Olympic Athletes
    - NOC: National Olympic Committee (country)
    - SPORT: Type of sport
    - YEAR: Year of Olympic participation
    - MEDAL: Type of medal awarded (Gold, Silver, Bronze)
- Relationship Mapping:
    - IN_COUNTRY: Athlete is affiliated with a country
    - ATTEND_SPORT: Athlete competes in a sport
    - ATTEND_YEAR: Athlete participates in a particular Olympic year
    - ATHLETE_MEDAL: Athlete receives a medal
    - COUNTRY_MEDAL: Country receives a medal
    - COUNTRY_ATTEND_SPORT: Country participates in a sport
    - COUNTRY_ATTEND_YEAR: Country participates in a specific year
- Centrality Metrics: PageRank, Degree, Betweenness, Closeness
- Weighted Scoring: Medal Weighting (🥇Gold = 3, 🥈Silver = 2, 🥉Bronze = 1)
- Similarity Analysis: Jaccard Index for inter-country sport profile similarity

## 🛠️ Tools Used:
Neo4j | Gephi |   

## 💻 How to Run Cypher Scripts in Neo4j  
1. Import Dataset
Download and import the main Olympic dataset into your Neo4j Desktop project:  
📄 [olympics_dataset.csv](https://github.com/mariaonz/sna_olympics/blob/main/olympics_dataset.csv)
2. Set Up Schema
Run the schema initialization script to define nodes and relationships:  
📄 [olympics_schema_cypher.cypher](https://github.com/mariaonz/sna_olympics/blob/main/code/olympics_schema_cypher.cypher)  
3. Run Network Analysis Scripts
Import and execute the following Cypher scripts to generate key insights:  
    - 🥇 Top 5 Influential Olympic Sports Based on Athlete Participation
[pagerank_top_influential_sports.csv](https://github.com/mariaonz/sna_olympics/blob/main/code/pagerank_top_influential_sports.csv)
    - 🏅 Top Performing Countries by Weighted Medal Score
[tbc]()
    - 🧠 Smart NOC Strategy: Countries That Know Their Strengths Best
[tbc]()
    - 🤝 Sports Similarity Comparison with Thailand
[Similarity_Sport.csv](https://github.com/mariaonz/sna_olympics/blob/main/code/Similarity_Sport.csv)
    - 🌍 Global Sports Connectivity & Thailand’s Network Position
[tbc]()
    - 🥊 Most Influential Thai Athletes in Olympic Network
[tbc]()
    - 🏆 Thailand's Medal Network Centrality Analysis
[tbc]()
    - 🏁 Compete Fair: Sports Without Giants
[tbc]()

## 📊 Network Analysis Result:
1. Top 5 Influential Olympic Sports Based on Athlete Participation
    - 🏃‍♂️ Athletics holds the highest influence in the Olympic network based on athlete participation, making it the most central and widely engaged sport across countries.
      
2. Top Performing Countries by Weighted Medal Score
    - USA leads by far – commanding golds and coverage across sports
    - USSR is efficient – fewer events, stronger gold yield
    - GBR plays the long game – steady medals across categories
3. Smart NOC Strategy: Countries That Know Their Strengths Best
    - Countries like Botswana, Uganda, and Kosovo show that smaller nations can succeed by focusing on a few strategic sports, demonstrating smart and efficient medal-winning strategies.
4. Sports Similarity Comparison with Thailand
    - 🌍 Denmark, Finland, and Morocco share the most similar Olympic sports profiles with Thailand, as measured by the Jaccard Index. Thailand also shows moderate similarity with China and the USA.
5. Global Sports Connectivity & Thailand’s Network Position
    - France and Italy represent the network core, participating broadly and centrally in the Olympic ecosystem.
    - Thailand has a moderate closeness score (0.53), indicating niche or peripheral overlap in selected sports.  
6. Most Influential Thai Athletes in Olympic Network
    - 🥊 Somluck Kamsing, Thailand’s legendary boxer, appears as the most central figure based on betweenness centrality. 
This indicates his strong connectivity across athlete clusters, likely due to participation over multiple years and intersecting events.
7. Thailand's Medal Network Centrality Analysis
    - Panipak and Manut stand out with the highest degree and betweenness, reflecting their diverse medal wins
and central roles in Thailand’s Olympic network.
8. Compete Fair: Sports Without Giants
    - Thailand has strong potential in “fair-play” sports like weightlifting, football, and cycling, identified through a high Equity-Weighted Medal Score (EWMS). These events offer frequent opportunities and balanced competition, making them ideal targets for strategic focus.

