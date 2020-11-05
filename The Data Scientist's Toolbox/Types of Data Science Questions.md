Broadly there are six types of questions
1. Descriptive
	- This is a classical plotting problem
	- In particular David Kriesel has some good examples of this in his CCC Talks
		- [36C3 - BahnMining - Pünktlichkeit ist eine Zier](https://www.youtube.com/watch?v=0rb9CfOvojk)
		- [David Kriesel: Traue keinem Scan, den du nicht selbst gefälscht hast](https://www.youtube.com/watch?v=7FeqF1-Z1g0)
		- [SpiegelMining – Reverse Engineering von Spiegel-Online (33c3)](https://www.youtube.com/watch?v=-YpwsdRKt8Q)
2. Exploratory
	- >The goal of exploratory analysis is to examine or **explore** the data and find **relationships** that weren’t previously known
	- This seems the most dangerous because of [[Publication Bias]] and the general danger of not even doing [[Bonferroni Correction]]
3. Inferential
	- Use small data sets to try to say something about a bigger population
	- The hard part is that in this case we do not necessarily have a representative sample or a large sample
4. Predictive
	- Predict the price of something. Most [Kaggle](https://www.kaggle.com) competitions seem to be along these lines
	- Quantiative Finance seems to focus on this as well.
5. Causal
	- These can be hard to do from observational data
	- Need to have a good initial guess for the underlying causal diagram so we can test them
	- Randomized trials allow for this by basically closing all backdoors
6. Mechanistic
	- Not very common
	- usually only feasible in physical or engineering sciences

