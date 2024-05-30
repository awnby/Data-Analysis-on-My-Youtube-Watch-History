# YouTube Watch History Data Analysis

### Project Description
Recently, I discovered Google Takeout, which lets anyone access the data attached to their specific Google account. This gave me an idea: how can I utilize this feature to analyze my online behavior, specifically my YouTube watch history, and what can I learn from such analysis? So, in an attempt to answer this question to the best of my ability, I sought out to create a Youtube Wrapped (similar to the very popular, Spotify Wrapped, which analyzes your Spotify listening habits) to gain insight on my watching habits and share it in a neat and readable dashboard.

### Data Cleaning + Enhancement
Following the tutorial on how to use Google Takeout (https://support.google.com/accounts/answer/3024190?hl=en), I was able to download a json of my Youtube watch history, which I wrote into a csv in my preprocessing.ipynb file. The data is structured as so: each entry is a video (note: entries aren't unique since I could've watched the same video multiple times) and for each video was the title, video URL, Youtuber name, channel URL, and watched time (in ISO 8601 format). Inconveniently, the raw data contained many videos that were either a Google Ad, a Youtube Playable, or a currently unavailable/removed video. All such entries are either not representative of my watch history or simply unable to access information from (given that they are unavailable now). So, for each type of these videos, I looked to find a unique commonality and wrote a script to delete any data entry with this commonality. For example, every survey question had its title set to "Answered survey question," so I deleted all entries with that title. I recognize that this process isn't exactly robust, as I may have deleted a genuine data point with the same title, but in a dataset of 23297 videos, I am ok with that potential sacrifice (which is also very unlikely). To prevent this, though, I tried to make these commonalities as specific as possible.
The information already given in the data is great, but is missing a couple key components, namely the video category. Youtube sets every video to its own category, which is chosen from a list predetermined by Youtube, including categories like music, comedy, gaming, and more. Along with a video's category are its tags and description: essentially, tags are keywords that help push a video up in the algorithm and a description is the textbox found underneath every video you watch. Because these two are determined by the Youtuber, there's a ton of variability in what words certain channels use, which makes it difficult to compare. However, I plan to create a word cloud, as a non-rigorous, visual representation of what words appear in my videos the most.
Now, in order to add all this information, I will have to utilize the Youtube Data v3 API to 

In the original data are a couple videos that are either a Google Ad, survey question, or currently unavailable/removed video. All such videos are either not representative of my watch history or unable to access crucial information from. I will be filtering these videos out from the csv before even reading it in.

More about the currently unavailable/removed videos in this step: the following code won't eliminate all such videos. However, what this will do is prevent any further bugs in the code. This is because certain videos that have been taken down are put into the CSV file as videos with less columns than other videos. I will deal with this later on in the code but for now, this will simplify the solution.






