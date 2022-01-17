jQuery("#simulation")
  .on("swipeleft", ".s-79c655be-8cac-4a32-8d33-99312d9f1701 .swipeleft", function(event, data) {
    var jEvent, jFirer, cases;
    if(data === undefined) { data = event; }
    jEvent = jimEvent(event);
    jFirer = jEvent.getEventFirer();
    if(jFirer.is("#s-firs")) {
      cases = [
        {
          "blocks": [
            {
              "actions": [
                {
                  "action": "jimShow",
                  "parameter": {
                    "target": [ "#s-second" ],
                    "transition": {
                      "type": "slideleft",
                      "duration": 700
                    }
                  },
                  "exectype": "serial",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1": {
                      "attributes": {
                        "background-color": "#D9D9D9",
                        "background-attachment": "scroll"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1": {
                      "attributes-ie": {
                        "-pie-background": "#D9D9D9",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes": {
                        "background-color": "#54BAB5"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes-ie": {
                        "-pie-background": "#54BAB5",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                }
              ]
            }
          ],
          "exectype": "serial",
          "delay": 0
        }
      ];
      event.data = data;
      jEvent.launchCases(cases);
    } else if(jFirer.is("#s-second")) {
      cases = [
        {
          "blocks": [
            {
              "actions": [
                {
                  "action": "jimShow",
                  "parameter": {
                    "target": [ "#s-thrist" ],
                    "transition": {
                      "type": "slideleft",
                      "duration": 700
                    }
                  },
                  "exectype": "serial",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3": {
                      "attributes": {
                        "background-color": "#54BAB5"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3": {
                      "attributes-ie": {
                        "-pie-background": "#54BAB5",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes": {
                        "background-color": "#D9D9D9"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes-ie": {
                        "-pie-background": "#D9D9D9",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                }
              ]
            }
          ],
          "exectype": "serial",
          "delay": 0
        }
      ];
      event.data = data;
      jEvent.launchCases(cases);
    }
  })
  .on("swiperight", ".s-79c655be-8cac-4a32-8d33-99312d9f1701 .swiperight", function(event, data) {
    var jEvent, jFirer, cases;
    if(data === undefined) { data = event; }
    jEvent = jimEvent(event);
    jFirer = jEvent.getEventFirer();
    if(jFirer.is("#s-second")) {
      cases = [
        {
          "blocks": [
            {
              "actions": [
                {
                  "action": "jimShow",
                  "parameter": {
                    "target": [ "#s-firs" ],
                    "transition": {
                      "type": "slideright",
                      "duration": 700
                    }
                  },
                  "exectype": "serial",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes": {
                        "background-color": "#D9D9D9"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes-ie": {
                        "-pie-background": "#D9D9D9",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1": {
                      "attributes": {
                        "background-color": "#54BAB5",
                        "background-attachment": "scroll"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_1": {
                      "attributes-ie": {
                        "-pie-background": "#54BAB5",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                }
              ]
            }
          ],
          "exectype": "serial",
          "delay": 0
        }
      ];
      event.data = data;
      jEvent.launchCases(cases);
    } else if(jFirer.is("#s-thrist")) {
      cases = [
        {
          "blocks": [
            {
              "actions": [
                {
                  "action": "jimShow",
                  "parameter": {
                    "target": [ "#s-second" ],
                    "transition": {
                      "type": "slideright",
                      "duration": 700
                    }
                  },
                  "exectype": "serial",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes": {
                        "background-color": "#54BAB5"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_2": {
                      "attributes-ie": {
                        "-pie-background": "#54BAB5",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                },
                {
                  "action": "jimChangeStyle",
                  "parameter": [ {
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3 .shapert-clipping": {
                      "attributes": {
                        "left": "0px",
                        "top": "0px",
                        "width": "15px",
                        "height": "15px",
                        "position": "absolute",
                        "overflow": "hidden"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3 .content": {
                      "attributes": {
                        "width": "15px",
                        "height": "15px"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3": {
                      "attributes": {
                        "background-color": "#D9D9D9"
                      }
                    }
                  },{
                    "#s-79c655be-8cac-4a32-8d33-99312d9f1701 #s-point_3": {
                      "attributes-ie": {
                        "-pie-background": "#D9D9D9",
                        "-pie-poll": "false"
                      }
                    }
                  } ],
                  "exectype": "parallel",
                  "delay": 0
                }
              ]
            }
          ],
          "exectype": "serial",
          "delay": 0
        }
      ];
      event.data = data;
      jEvent.launchCases(cases);
    }
  });