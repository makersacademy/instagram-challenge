# Process for developing on this project

_The following is only a suggestion. This process tries to mirror as closely as possible a typical dev team's development process, shortened to two days from a typical 1-, 2- or 4-week sprint._

### 2 Day Sprints

#### 1. Planning Session
Have a planning session where you choose a number of unestimated tickets in `Unestimated`
  - Estimate the complexity of the tickets, perhaps using [story points](https://www.atlassian.com/agile/project-management/estimation) and note it on the cards
  - If the task is to big, split it into smaller cards, and estimate those.
  - Decide, given your team's resources and the estimations on the cards, how many tasks/points the team can reasonably achieve in 2 days.
  - Move these  estimated cards into `To Do`

#### 2. Development
On your card wall, pairs should assign themselves to a card in 'To do' and move it across to `In progress`.
  - Make a branch and work on that branch to complete the task on the card
  - When the task is complete and CI is passing on GitHub, make a PR and move the ticket to `Review`
  - Pairs must get 2 approvals before they merge the code - a team member can [approve]()
    - The expectation is you give an approval if you understand how the code works and think it's of good quality
    - Try to use a PR as a knowledge-sharing ground
      - Requesters should write an informative description of what the PR changes, and link it to a ticket for more information.
      - Reviewers should discuss bits of code on the PR before approving.
  -  Once code is merged into master, ensure it is (automatically) deployed correctly
  -  Move the ticket into `Done` only once it is successfully in production

Then find the next ticket in `To Do` to tackle. If there's nothing left, call another planning session.

#### 3. Retrospection

1. Each day, consider having a standup in the morning and the afternoon.

2. All sprints should end in a retrospection where the team gathers together to celebrate the work done, and discuss how the sprint went in order to make the next sprint better.

- Demo the work done for each other!
- Practice communicating and sharing feedback
- It is natural for task estimation to get better as the team gets better understanding how to
  - split tickets
  - how to work with each other
  - becomes familiar with the codebase
- Perhaps find a way to measure velocity if this interests you: https://manifesto.co.uk/how-to-measure-velocity-agile/
- Then organise the next planning session!
