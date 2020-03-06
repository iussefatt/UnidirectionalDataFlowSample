# UnidirectionalDataFlowSample

This sample project uses unidirectional data flow approach, looking to solve problems like many entry points from view controllers to view models.
The main advantage of this structure is centralize where view actions happen and what it returns in a single place.

Also, it's more testable since almost every function where bussiness logic lives are pure.

## State

The view representation. It contains also visual data.

## Action

Every action comming from the view, it can be any interaction, like a button tap or an initial loading, for example.

## Mutation

Represents the transformation the state will receive, based in the given action.
The `mutate()` method lives inside the view model and what it does is take an `Action` and transforms it into a `Mutation`.

This is the place of every bussiness logic happens, like requests, for example.

## Reducer

Takes the `Mutation` and the current `State` then reduce them into a new `State`.

## Module manager

Nothing but a coordinator

## Module builder

Responsible for instantiante  every view controller and it's dependencies (view model, service, etc).
