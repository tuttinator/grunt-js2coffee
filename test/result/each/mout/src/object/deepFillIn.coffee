define ["./forOwn", "../lang/isPlainObject"], (forOwn, isPlainObject) ->
  
  ###
  Deeply copy missing properties in the target from the defaults.
  ###
  deepFillIn = (target, defaults) ->
    i = 0
    n = arguments_.length
    obj = undefined
    while ++i < n
      obj = arguments_[i]
      if obj
        forOwn obj, (newValue, key) ->
          curValue = target[key]
          unless curValue?
            target[key] = newValue
          else deepFillIn curValue, newValue  if isPlainObject(curValue) and isPlainObject(newValue)

    target
  deepFillIn