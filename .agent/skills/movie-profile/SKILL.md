---
name: movie-profile
description: >-
  Generates a structured Markdown movie profile containing metadata (title,
  director, year, genres), verified links to the cover image and curated screen
  grabs, a 100-word full-spoiler plot summary, and locally downloaded cover and
  screen grab images. Use this skill whenever the user asks for a movie breakdown,
  summary, or visual profile for a film.
---

# Movie Profile Generator

Follow this repeatable workflow to research a film, verify all web and image URLs, download the cover and screen grab assets locally, and produce a formatted Markdown file.

## Output Template

Format the generated `<movie-slug>.md` file using the following structure:

```markdown
Movie Title: <title>
Movie Director: <director>
Year Produced: <year>
Cover Image: <verified URL to cover image>
Genre(s): <genre 1>, <genre 2>
Screen Grabs: <verified URL to a website containing curated screen grabs from the film>

Summary:

<100-word summary of the film that explains the complete plot and story progression, including the ending and all major spoilers>.

---

## Cover Image

![<Movie Title> (<Year>) Official Poster](images/<movie-slug>/cover.jpg)

---

## Curated Screen Grabs

Curated screen grabs from [<Source Name>](<Screen Grabs URL>):

![<Scene/Character Description> - Screen Grab 1](images/<movie-slug>/screengrab_01.jpg)
![<Scene/Character Description> - Screen Grab 2](images/<movie-slug>/screengrab_02.jpg)
```

## Step-by-Step Procedure

### 1. Research Film Metadata & Full Plot (With Spoilers)
- Search authoritative sources (Wikipedia, distributor pages like A24, IMDb, TMDb, and film reviews) to confirm:
  - **Movie Title**, **Director**, **Year Produced**, and **Genre(s)**.
  - **Complete Plot Progression**: Include the setup, rising conflict, climax, and exact ending (do not avoid spoilers).

### 2. Write & Verify the 100-Word Spoiler Summary
- Draft a single-paragraph summary explaining the plot and story progression from beginning to end, including all major twists and the resolution.
- Target **100 words** (verify word count via `len(summary.split())`).

### 3. Locate & Verify Working Links
- Find a direct image URL for the official theatrical poster/cover image (e.g., from Wikipedia, distributor S3/CDN assets, or TMDb).
- Find a curated screen grabs / cinematography stills webpage (e.g., Film-Grab, ShotDeck, Motion Picture Association DP breakdowns, distributor press pages, or cinematographer portfolios) and extract direct URLs for 5–7 representative screen grabs.
- **Verify every link** before including it by making an HTTP request (with a browser `User-Agent`) to confirm an `HTTP 200` status code and expected `Content-Type` (`text/html` for pages, `image/*` for images).

### 4. Download Images Locally
- Create `images/<movie-slug>/` in the workspace and download the cover image and all curated screen grabs locally:

```bash
mkdir -p images/<movie-slug>
python3 -c '
import urllib.request, os

images = {
    "cover.jpg": "<COVER_IMAGE_URL>",
    "screengrab_01.jpg": "<SCREENGRAB_1_URL>",
    # Add remaining screen grabs...
}

out_dir = "images/<movie-slug>"
for name, url in images.items():
    dest = os.path.join(out_dir, name)
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=15) as resp:
        data = resp.read()
        with open(dest, "wb") as f:
            f.write(data)
    print(f"Downloaded {name} ({len(data)} bytes)")
'
```

### 5. Write Markdown File & Commit Changes
- Write the Markdown file to `<movie-slug>.md` in the workspace, embedding the downloaded local images (`images/<movie-slug>/...`) while keeping the verified remote links in the header fields.
- If working inside a Jujutsu (`jj`) repository and any downloaded high-resolution stills exceed `1 MiB`, ensure `snapshot.max-new-file-size` is configured (e.g., `jj config set --repo snapshot.max-new-file-size 5242880`) before recording the incremental commit (`jj describe -m "..." && jj new`).
