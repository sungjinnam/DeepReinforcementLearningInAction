# Deep Reinforcement Learning In Action

Forked code Snippets from the [Deep Reinforcement Learning in Action](https://www.manning.com/books/deep-reinforcement-learning-in-action) book from Manning, Inc.
More comments and details are added as I go through the chapters. 

## Dockerize
- build
```
docker build -t deep_reinforcement_learning_in_action_pytorch .
```

- run
```
docker run -it -p 8888:8888 -v ~/Documents/DeepReinforcementLearningInAction/notebooks:/app/notebooks deep_reinforcement_learning_in_action_pytorch
```

- TODO: enable jupyterlab extension
