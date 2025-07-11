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
- Centrality Metrics: PageRank, Degree, Betweenness, Closeness, Eigenvector
- Weighted Scoring: Medal Weighting (Gold = 3, Silver = 2, Bronze = 1)
- Similarity Analysis: Jaccard Index for inter-country sport profile similarity

## 📊 Network Analysis Result:
- Top 5 Influential Olympic Sports Based on Athlete Participation
- Sports Similarity Comparison with Thailand
- Top Performing Countries by Weighted Medal Score
- Most Influential Athletes by Eigenvector Centrality
- Thailand's Medal Network Centrality Analysis
- Most Influential Thai Athletes in Olympic Network
- Smart NOC Strategy: Countries That Know Their Strengths Best
