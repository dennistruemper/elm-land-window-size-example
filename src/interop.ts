// This returns the flags passed into your Elm application
export const flags = async ({ env }: ElmLand.FlagsArgs) => {
  const dimensions = currentDimensions();
  return { ...dimensions };
};

// This function is called after your Elm app starts
export const onReady = ({ app, env }: ElmLand.OnReadyArgs) => {
  const dimensions = currentDimensions();
  console.log("Elm is ready ", app);
  console.log("With dimensions: ", dimensions);

  window.onresize = () => {
    const dimensions = currentDimensions();
    console.log("Resized to: ", dimensions);
    app.ports?.dimensions.send(dimensions);
  };
};

function currentDimensions() {
  return {
    width: window.innerWidth,
    height: window.innerHeight,
  };
}

// Type definitions for Elm Land
namespace ElmLand {
  export type FlagsArgs = {
    env: Record<string, string>;
  };
  export type OnReadyArgs = {
    env: Record<string, string>;
    app: { ports?: { dimensions: InputPort } };
  };
  export type InputPort = {
    send: (data: unknown) => void;
  };
}
