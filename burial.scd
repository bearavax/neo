(
s.waitForBoot {
    // Define a kick drum synth
    SynthDef(\kick, {
        |out=0, freq=60, amp=0.8, decay=0.3|
        var env = EnvGen.kr(Env.perc(0.01, decay), doneAction: 2);
        var sig = SinOsc.ar(freq) * env * amp;
        Out.ar(out, sig ! 2);
    }).add;

    // Define a snare drum synth
    SynthDef(\snare, {
        |out=0, amp=0.5, decay=0.2|
        var env = EnvGen.kr(Env.perc(0.01, decay), doneAction: 2);
        var noise = WhiteNoise.ar * env * amp;
        Out.ar(out, noise ! 2);
    }).add;

    // Define a hi-hat synth
    SynthDef(\hihat, {
        |out=0, amp=0.3, decay=0.1|
        var env = EnvGen.kr(Env.perc(0.01, decay), doneAction: 2);
        var noise = WhiteNoise.ar * env * amp;
        Out.ar(out, noise ! 2);
    }).add;

    // Schedule the beat pattern
    TempoClock.default.tempo = 130/60;
    Pbind(
        \instrument, Pseq([\kick, \snare, \hihat, \kick, \hihat, \snare, \hihat, \kick], inf),
        \dur, Pseq([1, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5], inf)
    ).play;
};
)