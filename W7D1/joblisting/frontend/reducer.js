const initialState = {
  city: "Please Select",
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case "SWITCH_LOCATION":
      let newState = merge({
        city: action.city,
        jobs: action.jobs
      }, state);
      return newState;
    default:
      return state;
  }
};

export default reducer;
