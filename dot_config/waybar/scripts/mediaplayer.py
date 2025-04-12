#!/usr/bin/env python3

import argparse
import json
import os
import sys
import signal
import time

parser = argparse.ArgumentParser()
parser.add_argument('--player', type=str, default='spotify')
parser.add_argument('--format', type=str, default='{artist} - {title}')
parser.add_argument('--max-length', type=int, default=40)
args = parser.parse_args()

def signal_handler(sig, frame):
    sys.stdout.write(json.dumps({"text": "No music", "class": "stopped", "alt": "No music"}))
    sys.stdout.flush()
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)

def get_status():
    try:
        cmd = f"playerctl --player={args.player} status 2>/dev/null"
        return os.popen(cmd).read().strip()
    except:
        return "Stopped"

def get_artist():
    try:
        cmd = f"playerctl --player={args.player} metadata artist 2>/dev/null"
        return os.popen(cmd).read().strip()
    except:
        return ""

def get_title():
    try:
        cmd = f"playerctl --player={args.player} metadata title 2>/dev/null"
        return os.popen(cmd).read().strip()
    except:
        return ""

def get_album():
    try:
        cmd = f"playerctl --player={args.player} metadata album 2>/dev/null"
        return os.popen(cmd).read().strip()
    except:
        return ""

def get_position():
    try:
        cmd = f"playerctl --player={args.player} position --format '{{position}}' 2>/dev/null"
        position_sec = int(float(os.popen(cmd).read().strip()))
        minutes, seconds = divmod(position_sec, 60)
        return f"{minutes}:{seconds:02d}"
    except:
        return "0:00"

def get_length():
    try:
        cmd = f"playerctl --player={args.player} metadata mpris:length 2>/dev/null"
        length_microsec = int(os.popen(cmd).read().strip())
        length_sec = length_microsec // 1000000
        minutes, seconds = divmod(length_sec, 60)
        return f"{minutes}:{seconds:02d}"
    except:
        return "0:00"

def truncate(text, max_len=40):
    if len(text) > max_len:
        return text[:max_len-3] + "..."
    return text

def main():
    # Print initial "No music" state
    output = {"text": "No music", "class": "stopped", "alt": "No music"}
    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()
    
    while True:
        status = get_status()
        
        if status.lower() == 'playing' or status.lower() == 'paused':
            artist = get_artist()
            title = get_title()
            album = get_album()
            position = get_position()
            length = get_length()
            
            if artist and title:
                text = f"{artist} - {title}"
            elif title:
                text = title
            else:
                text = "Playing"
                
            text = truncate(text, args.max_length)
            
            tooltip = f"{artist} - {title}"
            if album:
                tooltip += f"\nAlbum: {album}"
            tooltip += f"\n{position}/{length}"
            
            if status.lower() == 'playing':
                text = "   " + text
            else:
                text = "⏸ " + text
            
            output = {
                "text": text,
                "class": status.lower(),
                "alt": tooltip,
                "tooltip": tooltip
            }
        else:
            output = {
                "text": "No music",
                "class": "stopped",
                "alt": "No music",
                "tooltip": "No music playing"
            }
        
        sys.stdout.write(json.dumps(output) + '\n')
        sys.stdout.flush()
        time.sleep(1)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        signal_handler(None, None)