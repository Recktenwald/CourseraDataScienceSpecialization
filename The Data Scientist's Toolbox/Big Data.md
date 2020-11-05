The [[Three Vs]], Volume, Variety, and Velocity characterize big data.
Technological advances have allowed us to collect and make sense of more and more unstructured data like bodies of texts, videos, images and much more.

## Challanges

These data types are often hard to deal with for various reasons. First of all many 'traditonal' methods just don't make sense. E.g.: How would modeling each pixel of an (let's say greyscale) image as a uniform random variable help? 
So one challange is finding ways to even start working with them. In practice this often involves a lot of human work to annotate and interpret images or videos so that we can start doing interesting stuff. GPT and various GANs come to mind.

Also it is big, so often speed is an actual concern. In one of his lectures (I think Intro to Machine Learning for coders), Jeremy Howard, uses a Kaggle competition with many million rows of data as an example. Training anything on the whole data set would take incredibly long. In particular during an exploratory stage of the analysis this would grind everything to a halt. So we need ways to work with only parts of the data.

Next it is constantly changing and updating. In many real world applications one has to set up a data pipeline that automatically collects and uses data to update a model. I would be surprised if this were not a big challange for quantitative finance.

Last but not least the variety can be overwhelming. Given that there is practically infinite amounts of data how do we even begin to find the type of data we need to answer our question?

This is one problem that cannot be solved with simply collecting **more** data. If we are missing some important data stream we are doomed no matter what.

## Benefits
The law of large numbers tells us that random fluctuations will mainly cancel out if we have enough data, and with big data, that is often a fair assumption.

Next, it might be hard to set up automatic pipelines, but once they are in place an organization can be much more agile. This should ideally improve decision making.

The variety of big data allows us to tackle all sorts of questions. A friend of mine is doing analysis on public Instagram posts to find out what relationship people have to their local forests and (among other things) how COVID-19 has influenced it. If there weren't a huge database of all kinds of images from a large number of people in a large number of settings, questions like these might be unanswerable in practice.



