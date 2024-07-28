## Current Plan
For a while, I've been meaning to do a project involving Formula 1 and so I've decided to go ahead and create a project to analyze telemetry data from playing the Formuala 1 2019 game, and see if I can apply analysis/modelling techniques and data visualization to improve my driving in the game. I then also plan on creating a front-end interface to try and record/display my progress (with a greater focus on visuals), store the data in a db, and see if I can play with data streaming, such as with Kafka, to learn a bit more from this project. If possible, I want to see if, after all of this, I can create an interactive trainer to not only analyze past data, but also recommend improvements and changes in real-time. There are some features of this I can implement individually (such as tire wear, engine damage, crash risk, etc). Let's see where this goes, but this is my general plan for the time being. I may also setup my own UDP telemetry interpreter later on so I get access to more telemetry fields that are not exposed on the SRT (Sim Racing Telemetry) tool.


## Current Progress

I'll be starting off with descriptive analysis to get a handle on the data I'm working with, the main features, trends, and then move onto more predictive and prescriptive analysis. 

## Technologies

- Pandas

## Techniques/Topics I've Learnt/Applied

## Useful Links

- [F1 2019 Telemetry Specifications](https://f1-2019-telemetry.readthedocs.io/en/latest/telemetry-specification.html)
- [F1 2019 Telemetry package documentation](https://f1-2019-telemetry.readthedocs.io/en/latest/package-documentation.html)
