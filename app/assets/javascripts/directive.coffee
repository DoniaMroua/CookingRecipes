###************************************Custom directives*****************************************###

@app.directive 'datepicker', ->
  {
    require: 'ngModel'
    link: (scope, el, attr, ngModel) ->
      $(el).datepicker onSelect: (dateText) ->
        scope.$apply ->
          ngModel.$setViewValue dateText
          return
        return
      return

  }