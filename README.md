# Example how to use window width and height on a page

1. create a fresh elm-land application
2. prepare customize Shared (elm-land customize shared), no changes by now
3. customize Shared.Model and Shared init with dummy values
4. upgrade Home to a page (elm-land add page /)
5. use Shared Data in Home page (dummy values for now)
6. prepare to customize interop file. will use typescript, hope this is familiar. No changes by now: elm-land customize ts
7. print inital dimensions on startup in interopFile
8. insert initial dimensions as flags to started application
9. add Port JS To Elm for dimension updates

- and add Port.elm to handle updates
- and add a Shared.Msg DimensionsChanged to handle updates for Port JS to Elm
- and add a onResize action in interopTs to update the size whenever the size changes

Point 9 is quite large and a lot to unpack. But I was unsure if it provides value in smaller steps, if you can not see some value in between, this way you can play around with it.
