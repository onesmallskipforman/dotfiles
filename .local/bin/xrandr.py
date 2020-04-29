#!/usr/bin/python3

# A script for tuning Xorg display parameters

import os, sys

def trunc(tup):
  return tuple(int(i) for i in tup)

def runcmd(cmdstr):
  cmdfmt = ' '.join(cmdstr.split())
  print(cmdfmt + "\n")
  os.system(cmdfmt)

def display(id, res, scale, pos, fb):
  runcmd("""
    xrandr
    --output    {}
      --mode    {}x{}
      --scale   {:.3F}x{:.3F}
      --pos     {}x{}
      --panning 0x0 --fb {}x{}
  """.format(id, *trunc(res), scale, scale, *trunc(pos), *trunc(fb)))

def one():
  # tuning parameters
  dpi   = 150 # 227
  e1res = (1920, 1200) # (2560, 1600)

  # run commands
  runcmd("xrandr --output HDMI-2 --off")# --fb {}x{}".format(*e1res))
  runcmd("xrandr --output HDMI-1 --off --fb {}x{}".format(*e1res))
  runcmd("echo \"Xft.dpi: {}\" | xrdb -merge && xrandr --dpi {} --fb {}x{}".format(dpi, dpi, *e1res))
  display("eDP-1" , e1res, 1, (0,0), e1res)
  runcmd("i3-msg restart")

def two():
  # tuning parameters
  dpi   = 96
  e1res = (1920, 1200) # (2560, 1600)
  h1res = (1920, 1080)
  p     = 0.0 # percentage of how much scaling is being done to the externals and how much to the internal
  pe    = 0.6 # percentage of how much we are honoring the prescribed internal scaling
  ph    = 1.0 # percentage of how much we are honoring the prescribed external scaling

  # true height of monitors, used to compute true scale0
  e1ymm = 179
  h1ymm = 340

  scale0 = e1res[1]/h1res[1] * h1ymm/e1ymm # how how much external needs to be scaled for correct ratio
  scaleH = (scale0 - 1)*p*ph + 1           # what we will scale external by, adjusted by p, adjusted again by ph
  scaleE = (scaleH/scale0 - 1)*pe + 1      # what we will scale internal by, adjusted by 1-p, adjusted again by pe

  # compute adjusted display sizes in pixels
  e1adj = (e1res[0]*scaleE, e1res[1]*scaleE)
  h1adj = (h1res[0]*scaleH, h1res[1]*scaleH )

  # matches ceterlines of displays, agnostic of true size
  shift = -(e1adj[1] - h1res[1]*scaleH)/2.0

  # compute display positions (added 1 because edges were bleeding over)
  e1pos = (0                      , shift)
  h1pos = (e1adj[0]            + 1, 0    )

  # framebuffer calculation
  fb = tuple(int(sum(i))+2 for i in zip(e1adj, h1adj))

  # run commands
  runcmd("echo \"Xft.dpi: {}\" | xrdb -merge && xrandr --dpi {} --fb {}x{}".format(dpi, dpi, *fb))
  runcmd("xrandr --output HDMI-2 --off --fb {}x{}".format(*fb))
  display("eDP-1" , e1res, scaleE, e1pos, fb)
  display("HDMI-1", h1res, scaleH, h1pos, fb)
  runcmd("i3-msg restart")

def three():
  # tuning parameters
  dpi   = 96
  e1res = (1920, 1200) # (2560, 1600)
  h1res = (1920, 1080)
  p     = 0.0 # percentage of how much scaling is being done to the externals and how much to the internal
  pe    = 0.6 # percentage of how much we are honoring the prescribed internal scaling
  ph    = 1.0 # percentage of how much we are honoring the prescribed external scaling

  # true height of monitors, used to compute true scale0
  e1ymm = 179
  h1ymm = 340

  scale0 = e1res[1]/h1res[1] * h1ymm/e1ymm # how how much external needs to be scaled for correct ratio
  scaleH = (scale0 - 1)*p*ph + 1           # what we will scale external by, adjusted by p, adjusted again by ph
  scaleE = (scaleH/scale0 - 1)*pe + 1      # what we will scale internal by, adjusted by 1-p, adjusted again by pe

  # compute adjusted display sizes in pixels
  e1adj = (e1res[0]*scaleE, e1res[1]*scaleE)
  h1adj = (h1res[0]*scaleH, h1res[1]*scaleH )
  h2adj = h1adj

  # matches ceterlines of displays, agnostic of true size
  shift = -(e1adj[1] - h1res[1]*scaleH)/2.0

  # compute display positions (added 1 because edges were bleeding over)
  e1pos = (0                      , shift)
  h1pos = (e1adj[0]            + 1, 0    )
  h2pos = (e1adj[0] + h1adj[0] + 1, 0    )

  # framebuffer calculation
  fb = tuple(int(sum(i))+2 for i in zip(e1adj, h1adj, h2adj))

  # run commands
  runcmd("echo \"Xft.dpi: {}\" | xrdb -merge && xrandr --dpi {} --fb {}x{}".format(dpi, dpi, *fb))
  display("eDP-1" , e1res, scaleE, e1pos, fb)
  display("HDMI-1", h1res, scaleH, h1pos, fb)
  display("HDMI-2", h1res, scaleH, h2pos, fb)
  runcmd("i3-msg restart")

def main():
  num = int(sys.argv[1])
  if   num == 1: one()
  elif num == 2: two()
  elif num == 3: three()
  else:
    print("Invalid Number of Monitors")
  print("Scaling Complete. You may have you restart apps for them to scale correctly")



if __name__ == "__main__":
  main()
























# def adjust(res, scale):
#   return (res[0]*scale, res[1], scale)

# difftopmm = 80
# shift = -e1res[1]*difftopmm/e1ymm
# [e1adj, h1adj, h2adj] = [(r[0]*s, r[1]*s) for r,s in zip((e1res, h1res, h2res), (scaleE, scaleH, scaleH))]





# class Display():
#   def __init__(id, res = (1920, 1080), scale = 1.0, pos = (0, 0), pfctr = 1.0):
#     self.id    = id
#     self.res   = res
#     self.scale = scale
#     self.pos   = pos
#     self.pfctr = p # TODO: this needs a better name

#   def getadj():
#     return (res[0]*scale, res[1]*scale)

#   def getcmd(fb):
#     str = """
#       xrandr
#       --output    {0}
#         --mode    {1}x{2}
#         --scale   {3:.3F}x{3:.3F}
#         --pos     {4}x{5}
#         --panning 0x0 --fb {6}x{7}
#     """.format(id, *self.res, self.scale, *self.pos, *fb)
#     return ' '.join(str.split())

#   def printandrun(fb):
#     cmd = self.getcmd(fb)
#     print(cmd)
#     os.system(cmd)


# def main():
#   # tuning parameters
#   dpi   = 96 # 227
#   e1.res = (1920, 1200) # (2560, 1600)
#   h1.res = (1920, 1080)
#   h2.res = h1.res
#   p     = 0.0 # percentage of how much scaling is being done to the externals and how much to the internal
#   pe    = 0.6 # percentage of how much we are honoring the prescribed internal scaling
#   ph    = 1.0 # percentage of how much we are honoring the prescribed external scaling

#   # true height of monitors, used to compute true scale0
#   e1ymm = 179
#   h1ymm = 340

#   scale0   = e1.res[1]/h1.res[1] * h1ymm/e1ymm # how how much external needs to be scaled for correct ratio
#   h1.scale = (scale0 - 1)*p*ph + 1             # what we will scale external by, adjusted by p, adjusted again by ph
#   h2.scale = h1.scale
#   e1.scale = (h1.scale/scale0 - 1)*pe + 1      # what we will scale internal by, adjusted by 1-p, adjusted again by pe

#   # compute adjusted display sizes in pixels
#   e1adj = e1.getadj()
#   h1adj = h1.getadj()
#   h2adj = h2.getadj()

#   # match ceterlines of displays, agnostic of true size
#   shift = -(e1adj[1] - h1.res[1]*h1.scale)/2.0

#   # compute display positions
#   e1.pos = (0                  , shift)
#   h1.pos = (e1adj[0]           , 0    )
#   h2.pos = (e1adj[0] + h1adj[0], 0    )

#   # framebuffer size calculation
#   fb = tuple(int(sum(i))+2 for i in zip(e1adj, h1adj, h2adj))


# if __name__ == "__main__":
#   main()
